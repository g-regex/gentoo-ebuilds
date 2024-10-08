# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=MSCHWERN
DIST_VERSION=0.08
inherit perl-module

DESCRIPTION="Base class for virtual base classes"

SLOT="0"
KEYWORDS="amd64 ~ppc sparc x86"

RDEPEND="
	>=dev-perl/Class-Data-Inheritable-0.20.0
	>=dev-perl/Carp-Assert-0.100.0
	>=dev-perl/Class-ISA-0.310.0
"
BDEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? ( virtual/perl-Test-Simple )
"
