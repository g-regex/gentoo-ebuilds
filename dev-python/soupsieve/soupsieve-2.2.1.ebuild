# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} pypy3 )

inherit distutils-r1

DESCRIPTION="A modern CSS selector implementation for BeautifulSoup"
HOMEPAGE="https://github.com/facelessuser/soupsieve/
	https://pypi.org/project/soupsieve/"
SRC_URI="https://github.com/facelessuser/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~x64-macos"

BDEPEND="
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		<dev-python/lxml-4.6.3-r1[${PYTHON_USEDEP}]
		dev-python/html5lib[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
