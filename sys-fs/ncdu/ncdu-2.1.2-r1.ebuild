# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit verify-sig

DESCRIPTION="NCurses Disk Usage"
HOMEPAGE="https://dev.yorhel.nl/ncdu"
SRC_URI="
	https://dev.yorhel.nl/download/${P}.tar.gz
	verify-sig? ( https://dev.yorhel.nl/download/${P}.tar.gz.asc )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-libs/ncurses:=[unicode(+)]"
RDEPEND="${DEPEND}"
BDEPEND="
	|| ( ~dev-lang/zig-0.9.1 ~dev-lang/zig-bin-0.9.1 )
	virtual/pkgconfig
	dev-lang/perl
	verify-sig? ( sec-keys/openpgp-keys-yorhel )
"

VERIFY_SIG_OPENPGP_KEY_PATH="${BROOT}"/usr/share/openpgp-keys/yoranheling.asc

# see https://github.com/ziglang/zig/issues/3382
# For now, Zig doesn't support CFLAGS/LDFLAGS/etc.
QA_FLAGS_IGNORED="usr/bin/ncdu"

src_test() {
	zig build test || die "Tests failed"
}

src_install() {
	emake PREFIX="${ED}"/usr install

	dodoc README.md ChangeLog
}
