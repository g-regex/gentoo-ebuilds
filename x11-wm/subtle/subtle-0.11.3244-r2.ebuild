# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby27 ruby30 ruby31"

inherit ruby-ng toolchain-funcs

DESCRIPTION="A manual tiling window manager"
HOMEPAGE="https://subforge.org/projects/subtle/wiki"
SRC_URI="https://dev.gentoo.org/~radhermit/dist/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc +xft xinerama xpm +xrandr +xtest"
RESTRICT="!test? ( test )"

RDEPEND="x11-libs/libX11
	xft? ( x11-libs/libXft )
	xinerama? ( x11-libs/libXinerama )
	xpm? ( x11-libs/libXpm )
	xtest? ( x11-libs/libXtst )
	xrandr? ( x11-libs/libXrandr )"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

ruby_add_rdepend "dev-ruby/minitar"
ruby_add_bdepend "dev-ruby/rake doc? ( dev-ruby/rdoc )"

all_ruby_unpack() {
	if [[ ${PV} == "9999" ]]; then
		mercurial_src_unpack
	else
		default
	fi
}

each_ruby_configure() {
	local myconf
	use debug && myconf+=" debug=yes" || myconf+=" debug=no"
	use xft && myconf+=" xft=yes" || myconf+=" xft=no"
	use xinerama && myconf+=" xinerama=yes" || myconf+=" xinerama=no"
	use xpm && myconf+=" xpm=yes" || myconf+=" xpm=no"
	use xtest && myconf+=" xtest=yes" || myconf+=" xtest=no"
	use xrandr && myconf+=" xrandr=yes" || myconf+=" xrandr=no"

	${RUBY} -S rake -v CC="$(tc-getCC)" destdir="${D}" ${myconf} config || die
}

each_ruby_compile() {
	${RUBY} -S rake -v build || die
}

all_ruby_compile() {
	use doc && { rake rdoc || die ; }
}

each_ruby_install() {
	${RUBY} -S rake -v install || die
}

all_ruby_install() {
	dodir /etc/X11/Sessions
	cat <<-EOF > "${D}/etc/X11/Sessions/${PN}"
		#!/bin/sh
		exec /usr/bin/subtle
	EOF
	fperms a+x /etc/X11/Sessions/${PN}

	insinto /usr/share/xsessions
	doins data/${PN}.desktop

	dodoc AUTHORS NEWS

	use doc && dodoc -r html
}

pkg_postinst() {
	elog "Note that surserver will currently not work since dev-ruby/datamapper"
	elog "is not in the tree."
}
