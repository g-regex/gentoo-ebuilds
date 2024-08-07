# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ADA_COMPAT=( gnat_2019 )
inherit ada autotools multiprocessing

MYP=${P}-20190424-19D98

DESCRIPTION="A complete Ada graphical toolkit"
HOMEPAGE="http://libre.adacore.com//tools/gtkada/"
SRC_URI="http://mirrors.cdn.adacore.com/art/5ce7f58931e87adb2d312c53
	-> ${MYP}-src.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+shared static-libs"

RDEPEND="${ADA_DEPS}
	dev-libs/atk
	dev-libs/glib:2
	media-libs/fontconfig
	media-libs/freetype
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/pango"
DEPEND="${RDEPEND}
	dev-ada/gprbuild[${ADA_USEDEP}]"

REQUIRED_USE="${ADA_REQUIRED_USE}"

S="${WORKDIR}"/${MYP}-src

PATCHES=(
	"${FILESDIR}"/${PN}-2017-r1-gentoo.patch
	"${FILESDIR}"/${P}-gentoo.patch
)

src_prepare() {
	default
	mv configure.{in,ac}
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use_enable shared) \
		--without-GL
}

src_compile() {
	emake -j1 PROCESSORS=$(makeopts_jobs)
}

src_install() {
	emake -j1 DESTDIR="${D}"
	einstalldocs
}
