# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs flag-o-matic

DESCRIPTION="Font utilities for eg manipulating OTF"
HOMEPAGE="
	https://lcdf.org/type/#typetools
	https://github.com/kohler/lcdf-typetools
"
SRC_URI="https://lcdf.org/type/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
IUSE="+kpathsea"

RDEPEND="kpathsea? ( virtual/tex-base dev-libs/kpathsea:= )"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure() {
	# gcc ICE with LTO: https://gcc.gnu.org/PR100010
	filter-flags -fdevirtualize-at-ltrans

	use kpathsea && has_version 'dev-libs/kpathsea' && append-cppflags "$($(tc-getPKG_CONFIG) --cflags kpathsea)"
	econf $(use_with kpathsea)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc NEWS.md README.md ONEWS
}
