# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gkrellm-plugin toolchain-funcs

DESCRIPTION="A simple countdown clock for GKrellM2"
SRC_URI="http://oss.pugsplace.net/${P}.tar.gz"
HOMEPAGE="http://freshmeat.sourceforge.net/projects/gkrellm-countdown"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc sparc x86"
IUSE=""

RDEPEND="app-admin/gkrellm:2[X]"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}
PATCHES=( "${FILESDIR}"/${PN}-makefile.patch )

src_compile() {
	emake CC="$(tc-getCC)" LDFLAGS="${LDFLAGS}"
}
