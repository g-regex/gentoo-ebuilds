# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour" # test-suite"
inherit haskell-cabal

DESCRIPTION="Backwards-compatible orphan instances for base"
HOMEPAGE="https://github.com/haskell-compat/base-orphans#readme"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE=""

RESTRICT=test # circular depends: base-orphans[test]->hspec->hspec-core->temporary->sxceptions->test-framework->base-orphans

RDEPEND=">=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.12"
# 	test? ( >=dev-haskell/hspec-2 <dev-haskell/hspec-3
# 		dev-haskell/quickcheck )
# "
