# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_P=${P/_p/-r}
DESCRIPTION="Calculate speeds, equilibrium arguments, node factors of tidal constituents"
HOMEPAGE="https://flaterco.com/xtide/files.html"
SRC_URI="ftp://ftp.flaterco.com/xtide/${MY_P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="static-libs"

DEPEND=">=sci-geosciences/libtcd-2.2.3"
RDEPEND="${DEPEND}"

MAKEOPTS+=" -j1"

S=${WORKDIR}/${P%_p*}

src_configure() {
	econf \
		$(use_enable static-libs static)
}

src_install() {
	default

	if ! use static-libs; then
		find "${ED}" -name '*.la' -delete || die
	fi
}
