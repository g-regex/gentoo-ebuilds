# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A preprocessor for less"
HOMEPAGE="https://github.com/wofr06/lesspipe"
SRC_URI="https://github.com/wofr06/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

# Please check again on bumps!
# bug #734896
RESTRICT="test"

BDEPEND="dev-lang/perl"
RDEPEND="${DEPEND}
	!<sys-apps/less-483-r1"

src_configure() {
	# Not an autoconf script.
	./configure --fixed || die
}

src_compile() {
	# Nothing to build (avoids the "all" target)
	:
}

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${D}" install
	einstalldocs
}

pkg_preinst() {
	if [[ -z ${REPLACING_VERSIONS} ]] ; then
		elog "This package installs 'lesspipe.sh' which is distinct from 'lesspipe'."
		elog "The latter is the Gentoo-specific version.  Make sure to update your"
		elog "LESSOPEN environment variable if you wish to use this copy."
	fi
}
