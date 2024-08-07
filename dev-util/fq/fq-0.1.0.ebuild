# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Tool for working with binary data (jq for binary formats)"
HOMEPAGE="https://github.com/wader/fq"
SRC_URI="https://github.com/wader/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://dev.gentoo.org/~sam/distfiles/${CATEGORY}/${PN}/${P}-deps.tar.xz"

LICENSE="MIT BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="test? ( dev-tcltk/expect )"

src_prepare() {
	default

	# https://github.com/wader/fq/issues/494
	sed -i -e '/test_repl.exp/d' Makefile || die
}

src_compile() {
	# Avoid -s being set in Makefile (stripping)
	export GO_BUILD_LDFLAGS="-w"

	default
}

src_install() {
	dobin fq
}
