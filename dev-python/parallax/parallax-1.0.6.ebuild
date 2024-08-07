# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
inherit distutils-r1

DESCRIPTION="Execute commands and copy files over SSH to multiple machines at once"
HOMEPAGE="https://github.com/krig/parallax/"
SRC_URI="mirror://pypi/${PN::1}/${PN}/${P}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~x86"

# Requires SSH connection to hosts for testing
RESTRICT="test"
