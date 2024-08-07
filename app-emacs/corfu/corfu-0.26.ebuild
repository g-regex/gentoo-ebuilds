# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=27

inherit elisp

DESCRIPTION="Completion Overlay Region FUnction"
HOMEPAGE="https://github.com/minad/corfu"
SRC_URI="https://github.com/minad/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	default
	mv extensions/*.el . || die
}

src_compile() {
	elisp_src_compile
	elisp-make-autoload-file
}
