# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Simple disk I/0 latency measuring tool"
HOMEPAGE="https://github.com/koct9i/ioping"
SRC_URI="https://github.com/koct9i/ioping/releases/download/v${PV}/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

PATCHES=( "${FILESDIR}"/${P}-sysmacros.patch )

src_prepare() {
	default
	sed \
		-e 's: -g : :g' \
		-e 's: $(LDFLAGS) : :g' \
		-e 's: -o : $(LDFLAGS) -o :g' \
		-e 's:-s -m:-m:g' \
		-e 's:LICENSE::g' \
		-e 's:-O2.*::g' \
		-i Makefile || die
}

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
