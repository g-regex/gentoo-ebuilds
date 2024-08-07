# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

NEED_EMACS=24.3

inherit elisp readme.gentoo-r1

DESCRIPTION="Various icon fonts propertized for Emacs"
HOMEPAGE="https://github.com/domtronn/all-the-icons.el/"
SRC_URI="https://github.com/domtronn/${PN}.el/archive/${PV}.tar.gz
			-> ${P}.tar.gz"
S="${WORKDIR}"/${PN}.el-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="test? ( app-emacs/f )"

DOC_CONTENTS="You may need to install the required fonts by executing
	the \"all-the-icons-install-fonts\" function."
DOCS=( README.md logo.png )
SITEFILE="50${PN}-gentoo.el"

src_compile() {
	elisp_src_compile
	elisp-compile data/*.el
}

src_test() {
	${EMACS} ${EMACSFLAGS} ${BYTECOMPFLAGS} \
			 -L . -L data -L test -l test/all-the-icons-test.el \
			 -f ert-run-tests-batch-and-exit || die "tests failed"
}

src_install() {
	elisp_src_install
	elisp-install ${PN}/data data/*.el{,c}
}
