# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

OFED_VER="3.12"
OFED_RC="1"
OFED_RC_VER="1"
OFED_SUFFIX="1"

inherit openib multilib-minimal

DESCRIPTION="OpenIB userspace RDMA CM library"

KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~ia64 ppc ppc64 ~sparc x86 ~amd64-linux"
IUSE="static-libs"

DEPEND="sys-fabric/libibverbs:${SLOT}[static-libs?,${MULTILIB_USEDEP}]"
RDEPEND="${DEPEND}
		!sys-fabric/openib-userspace"
block_other_ofed_versions

multilib_src_configure() {
	ECONF_SOURCE=${S} \
	econf $(use_enable static-libs static)
}

multilib_src_install_all() {
	einstalldocs
	find "${ED}" -name '*.la' -delete || die
}
