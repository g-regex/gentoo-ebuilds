# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..9} )
PYTHON_REQ_USE="sqlite"

inherit python-single-r1 desktop optfeature

DESCRIPTION="A booru-like media organizer for the desktop"
HOMEPAGE="https://hydrusnetwork.github.io/hydrus/ https://github.com/hydrusnetwork/hydrus"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/hydrusnetwork/hydrus.git"
else
	SRC_URI="https://github.com/hydrusnetwork/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

	KEYWORDS="~amd64"
fi

# hydrus itself is WTFPL
# icons included are CC-BY-2.5
LICENSE="WTFPL-2 CC-BY-2.5"
SLOT="0"
IUSE="+cloudscraper +ffmpeg +lz4 charts socks test +mpv"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RESTRICT="!test? ( test )"

# RDEPEND is sorted as such:
# - No specific requirements
# - Specific version or slot
# - Depends on use flags
RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/chardet[${PYTHON_USEDEP}]
		dev-python/html5lib[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/pyside2[widgets,gui,charts?,${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/send2trash[${PYTHON_USEDEP}]
		dev-python/service_identity[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		dev-python/twisted[${PYTHON_USEDEP}]
		media-libs/opencv[python,png,jpeg,${PYTHON_USEDEP}]

		>=dev-python/QtPy-1.9.0-r4[pyside2,${PYTHON_USEDEP}]
		dev-python/beautifulsoup:4[${PYTHON_USEDEP}]

		cloudscraper? ( dev-python/cloudscraper[${PYTHON_USEDEP}] )
		ffmpeg? ( media-video/ffmpeg )
		lz4? ( dev-python/lz4[${PYTHON_USEDEP}] )
		mpv? (
			media-video/mpv[libmpv,${PYTHON_USEDEP}]
			dev-python/python-mpv[${PYTHON_USEDEP}]
		)
		socks? (
			|| ( dev-python/requests[socks5,${PYTHON_USEDEP}]
				dev-python/PySocks[${PYTHON_USEDEP}] )
		)
	')
"
BDEPEND="
	${RDEPEND}
	$(python_gen_cond_dep '
		test? (
			dev-python/httmock[${PYTHON_USEDEP}]
			dev-python/mock[${PYTHON_USEDEP}]
			dev-python/nose[${PYTHON_USEDEP}]
		)
	')
"

PATCHES=(
	"${FILESDIR}/userpath-in-local-share.patch"
)

src_prepare() {
	default

	# Contains pre-built binaries for other systems and a broken swf renderer for linux
	rm -r bin/ || die
	# Build files used for CI, not actually needed
	rm -r static/build_files || die
	# Duplicate license file, not needed
	rm license.txt || die
	# Python requirements files, not needed
	rm requirements_*.txt || die
}

src_compile() {
	python_optimize "${S}"
}

src_test() {
	# The tests use unittest, but are run with a custom runner script.
	# QT_QPA_PLATFORM is required to make them run without X
	local -x QT_QPA_PLATFORM=offscreen
	"${EPYTHON}" "${S}/test.py" || die "Tests failed"
}

src_install() {
	local doc="${EPREFIX}/usr/share/doc/${PF}"
	elog "Hydrus includes an excellent manual, that can either be viewed at"
	elog "${doc}/html/help/index.html"
	elog "or accessed through the hydrus help menu."

	mv "help my client will not boot.txt" "help_my_client_will_not_boot.txt" || die

	local DOCS=(COPYING README.md Readme.txt help_my_client_will_not_boot.txt db/)
	local HTML_DOCS=("${S}"/help/)
	einstalldocs

	# Files only needed for testing
	rm test.py hydrus/hydrus_test.py || die
	rm -r hydrus/test/ static/testing/ || die

	# These files are copied into doc
	rm -r "${DOCS[@]}" "${HTML_DOCS[@]}" || die
	# The program expects to find documentation here, so add a symlink to doc
	dosym "${doc}/html/help" help

	insinto /opt/hydrus
	doins -r "${S}"/.

	exeinto /usr/bin
	python_newexe - hydrus-server < <(sed "s/python/${EPYTHON}/" "${FILESDIR}/hydrus-server" || die)
	python_newexe - hydrus-client < <(sed "s/python/${EPYTHON}/" "${FILESDIR}/hydrus-client" || die)

	make_desktop_entry "hydrus-client" "Hydrus Client" "/opt/hydrus/static/hydrus_non-transparent.png" \
					   "AudioVideo;FileTools;Graphics;Network;"
}

pkg_postinst() {
	optfeature "support for automatic port forwarding" "net-libs/miniupnpc"
}
