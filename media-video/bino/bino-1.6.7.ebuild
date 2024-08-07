# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic xdg

DESCRIPTION="Stereoscopic and multi-display media player"
HOMEPAGE="https://bino3d.org/"
SRC_URI="https://bino3d.org/releases/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug doc lirc video_cards_nvidia"

# <ffmpeg-5 for bug #907682 and bug #834400. >=bino-2 uses Qt 6 and drops ffmpeg.
RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtopengl:5
	dev-qt/qtwidgets:5
	>=media-libs/glew-1.6.0:0=
	>=media-libs/libass-0.9.9
	>=media-libs/openal-1.15.1
	virtual/libintl
	<media-video/ffmpeg-5:=
	lirc? ( app-misc/lirc )
	video_cards_nvidia? ( x11-drivers/nvidia-drivers[tools,static-libs] )"
DEPEND="${RDEPEND}"
BDEPEND="sys-devel/gettext
	virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/${PN}-1.6.7-gcc11.patch
)

src_configure() {
	if use video_cards_nvidia; then
		append-cppflags "-I${ESYSROOT}/usr/include/NVCtrl"
		append-ldflags "-L${ESYSROOT}/usr/$(get_libdir)/opengl/nvidia/lib -L${ESYSROOT}/usr/$(get_libdir)"
		append-libs "Xext"
	fi

	if use lirc; then
		append-cppflags "-I${ESYSROOT}/usr/include/lirc"
		append-libs "lirc_client"
	fi

	# Fix a compilation error because of a multiple definitions error in glew
	append-ldflags "-zmuldefs"

	econf \
		$(use_with video_cards_nvidia xnvctrl) \
		$(use_with lirc) \
		$(use_enable debug) \
		--without-equalizer \
		--with-qt-version=5
}

src_install() {
	default

	if ! use doc; then
		rm -rf "${ED}"/usr/share/doc/${PF}/html || die
	fi
}
