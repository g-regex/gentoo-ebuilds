# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9,10} )

inherit python-single-r1 xdg cmake

MY_PN="Commander-Genius"
MY_P="${MY_PN}-v${PV}"
DESCRIPTION="Open Source Commander Keen clone (needs original game files)"
HOMEPAGE="https://clonekeenplus.sourceforge.io"
SRC_URI="https://gitlab.com/Dringgstein/${MY_PN}/-/archive/v${PV}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+downloader opengl +python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"
RESTRICT="mirror" # contains keen files, but we do not install them

RDEPEND="
	media-libs/libsdl2[opengl?,video]
	media-libs/sdl2-image
	media-libs/sdl2-mixer[vorbis]
	media-libs/sdl2-ttf
	sys-libs/zlib[minizip]
	downloader? ( net-misc/curl )
	opengl? ( virtual/opengl )
	python? ( ${PYTHON_DEPS} )
"

DEPEND="
	${RDEPEND}
	dev-libs/boost
"

BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/${PN}-2.3.1-build.patch
	"${FILESDIR}"/${PN}-2.3.1-paths.patch
)

S="${WORKDIR}/${MY_P}"

SHAREDIR="/usr/share"
GAMESDIR="${SHAREDIR}/${PN}/games"
DOCS=()

src_configure() {
	local mycmakeargs=(
		-DAPPDIR="${EPREFIX}/usr/bin"
		-DGAMES_SHAREDIR="${EPREFIX}${SHAREDIR}"
		-DDOCDIR="${EPREFIX}/usr/share/doc/${PF}"
		-DDOWNLOADER=$(usex downloader)
		-DUSE_OPENGL=$(usex opengl)
		-DUSE_PYTHON3=$(usex python)
		-DUSE_SDL2=ON
		-DUSE_SDL_TTF=ON # Crashes when disabled.
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	# The normal executable name is weird.
	dosym CGeniusExe /usr/bin/${PN}

	# Game data can be manually installed here.
	keepdir "${GAMESDIR}"
}

pkg_postinst() {
	xdg_pkg_postinst

	elog "Run ${PN} to start the game. It will search for game data"
	elog "in ~/.CommanderGenius/games and ${EPREFIX}${GAMESDIR}."
	elog "You can also specify paths in cgenius.cfg or pass paths as an"
	elog "argument."
	elog
	use downloader && elog "Data for some games can be downloaded from the menu."
	elog
	elog "Check your settings in ~/.CommanderGenius/cgenius.cfg after you have"
	elog "started the game for the first time."
	elog
	use opengl && elog "You may also want to set \"OpenGL = true\"."
}
