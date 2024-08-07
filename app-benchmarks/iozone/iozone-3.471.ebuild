# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# TODO
#        ->   linux-arm            (32bit)   <-
#        ->   linux-AMD64          (64bit)   <-
#        ->   linux-ia64           (64bit)   <-
#        ->   linux-powerpc        (32bit)   <-
#        ->   linux-powerpc64      (64bit)   <-
#        ->   linux-S390           (32bit)   <-
#        ->   linux-S390X          (64bit)   <-
#
#        ->   freebsd              (32bit)   <-
#        ->   macosx               (32bit)   <-
#        ->   netbsd               (32bit)   <-
#        ->   openbsd              (32bit)   <-
#        ->   openbsd-threads      (32bit)   <-
#
# ~ia64 ~s390 alpha(?)

inherit toolchain-funcs

DESCRIPTION="Filesystem benchmarking program"
HOMEPAGE="http://www.iozone.org/"
SRC_URI="http://www.iozone.org/src/current/${PN}${PV/./_}.tar"

LICENSE="freedist"
SLOT="0"
KEYWORDS="amd64 arm ~ia64 ppc ppc64 ~sparc x86"
IUSE=""

S=${WORKDIR}/${PN}${PV/./_}

src_prepare() {
	default

	# Options FIX
	sed -i -e "s:CC	=.*:CC	=$(tc-getCC):g" \
		-e "s:-O3:${CFLAGS}:g" src/current/makefile || die
}

src_configure() {
	case ${ARCH} in
		x86|alpha)	PLATFORM="linux";;
		arm)		PLATFORM="linux-arm";;
		ppc)		PLATFORM="linux-powerpc";;
		ppc64)		PLATFORM="linux-powerpc64";;
		amd64)		PLATFORM="linux-AMD64";;
		ia64)		PLATFORM="linux-ia64";;
		s390)		PLATFORM="linux-S390";;
		*)			PLATFORM="linux-${ARCH}";;
	esac
}

src_compile() {
	emake -C src/current ${PLATFORM}
}

src_test() {
	cd "${T}" || die
	"${S}"/src/current/iozone testfile || die "self test failed"
}

src_install() {
	dosbin src/current/{iozone,fileop}

	dodoc docs/I* docs/Run_rules.doc src/current/Changes.txt
	doman docs/iozone.1
	cd src/current || die
	dodoc Generate_Graphs Gnuplot.txt gengnuplot.sh gnu3d.dem
}
