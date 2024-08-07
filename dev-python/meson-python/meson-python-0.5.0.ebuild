# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Meson PEP 517 Python build backend"
HOMEPAGE="
	https://pypi.org/project/meson-python/
	https://github.com/FFY00/meson-python/
"
SRC_URI="
	https://github.com/FFY00/meson-python/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="EUPL-1.2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pep621-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/tomli-1.0.0[${PYTHON_USEDEP}]
	>=dev-util/meson-0.60.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/GitPython[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-util/patchelf
	)
"

distutils_enable_sphinx docs \
	dev-python/furo \
	dev-python/sphinx-autodoc-typehints
distutils_enable_tests pytest
