# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} pypy3 )
inherit distutils-r1

MY_PN=${PN/-/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="A tiny LRU cache implementation and decorator"
HOMEPAGE="http://www.repoze.org"
SRC_URI="
	https://github.com/repoze/repoze.lru/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S="${WORKDIR}/${MY_P}"

LICENSE="repoze"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~ia64 ppc ~ppc64 ~riscv x86"

RDEPEND="dev-python/namespace-repoze[${PYTHON_USEDEP}]"

distutils_enable_tests unittest

python_install_all() {
	distutils-r1_python_install_all

	find "${D}" -name '*.pth' -delete || die
}
