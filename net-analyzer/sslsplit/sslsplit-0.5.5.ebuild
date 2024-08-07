# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic

DESCRIPTION="Transparent SSL/TLS interception"
HOMEPAGE="
	https://www.roe.ch/SSLsplit
	https://github.com/droe/sslsplit
"

LICENSE="BSD-2"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

if [[ ${PV} == *9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/droe/${PN}"
	EGIT_BRANCH="develop"
else
	SRC_URI="https://github.com/droe/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="
	dev-libs/libevent:=[ssl,threads]
	dev-libs/openssl:0=
	net-libs/libnet:1.1
	net-libs/libpcap
	elibc_musl? ( sys-libs/fts-standalone )"
DEPEND="${RDEPEND}
	test? ( dev-libs/check )"
BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}/${P}-openssl3.patch"
	"${FILESDIR}/${P}-libnet-pkgconfig.patch"
	"${FILESDIR}/${P}-libcrypto-pkgconfig.patch"
)

src_prepare() {
	default

	use elibc_musl && append-libs "-lfts"

	sed -i -e 's/-D_FORTIFY_SOURCE=2 //g' \
		-e 's/\<FEATURES\>/SSLSPLIT_FEATURES/g' GNUmakefile || die
	sed -i '/opts_suite/d' main.t.c || die
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" SYSCONFDIR="${EPREFIX}/etc" install
	dodoc AUTHORS.md NEWS.md README.md
}
