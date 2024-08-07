# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit pam autotools
DESCRIPTION="Toolkit for using one-time password authentication with HOTP/TOTP algorithms"
HOMEPAGE="http://www.nongnu.org/oath-toolkit/"
SRC_URI="http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz"

LICENSE="GPL-3 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~loong ppc64 ~riscv x86"
IUSE="pam pskc static-libs test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-libs/icu:=
	pam? ( sys-libs/pam )
	pskc? ( <dev-libs/xmlsec-1.3.0:= )"
DEPEND="${RDEPEND}
	test? ( dev-libs/libxml2 )
	dev-util/gtk-doc-am"

PATCHES=(
	"${FILESDIR}"/${P}-gcc7.patch
	"${FILESDIR}"/${P}-glibc228.patch
)

src_prepare() {
	default

	# Below files are verbatim copy. Effectively apply ${P}-gcc7.patch
	# to all of them.
	local s='oathtool/gl/intprops.h' d
	for d in {liboath/gl/tests,libpskc/gl,pskctool/gl}/intprops.h; do
		echo "Copy '${s}' to '${d}'"
		cp "${s}" "${d}" || die
	done

	# These tests need git/cvs and don't reflect anything in the final app
	sed -i -r \
		-e '/TESTS/s,test-vc-list-files-(git|cvs).sh,,g' \
		gl/tests/Makefile.am
	# disable portability warnings, caused by gtk-doc.make
	sed -i \
		-e '/AM_INIT_AUTOMAKE/ s:-Wall:\0 -Wno-portability:' \
		{liboath,libpskc}/configure.ac
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable test xmltest ) \
		$(use_enable pam) \
		$(use_with pam pam-dir $(getpam_mod_dir)) \
		$(use_enable pskc) \
		$(use_enable static-libs static)
}

src_test() {
	# without keep-going, it will bail out after the first testsuite failure,
	# skipping the other testsuites. as they are mostly independant, this sucks.
	emake --keep-going check
	[ $? -ne 0 ] && die "At least one testsuite failed"
}

src_install() {
	default
	find "${ED}" -name '*.la' -type f -delete || die
	if use pam; then
		newdoc pam_oath/README README.pam
	fi
	if use pskc; then
		doman pskctool/pskctool.1
	fi
}
