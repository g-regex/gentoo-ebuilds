# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

FORTRAN_NEEDED=fortran

inherit autotools cuda flag-o-matic fortran-2 toolchain-funcs

MY_P=${P/-mpi}

S="${WORKDIR}"/${MY_P}

IUSE_OPENMPI_FABRICS="
	openmpi_fabrics_ofed
	openmpi_fabrics_knem"

IUSE_OPENMPI_RM="
	openmpi_rm_pbs
	openmpi_rm_slurm"

IUSE_OPENMPI_OFED_FEATURES="
	openmpi_ofed_features_control-hdr-padding
	openmpi_ofed_features_connectx-xrc
	openmpi_ofed_features_rdmacm
	openmpi_ofed_features_dynamic-sl
	openmpi_ofed_features_failover"

DESCRIPTION="A high-performance message passing library (MPI)"
HOMEPAGE="https://www.open-mpi.org"
SRC_URI="https://www.open-mpi.org/software/ompi/v$(ver_cut 1-2)/downloads/${MY_P}.tar.bz2"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux"
IUSE="cma cuda +cxx fortran heterogeneous ipv6 mpi-threads romio threads vt
	${IUSE_OPENMPI_FABRICS} ${IUSE_OPENMPI_RM} ${IUSE_OPENMPI_OFED_FEATURES}"

REQUIRED_USE="
	openmpi_rm_slurm? ( !openmpi_rm_pbs )
	openmpi_rm_pbs? ( !openmpi_rm_slurm )
	openmpi_ofed_features_control-hdr-padding? ( openmpi_fabrics_ofed )
	openmpi_ofed_features_connectx-xrc? ( openmpi_fabrics_ofed )
	openmpi_ofed_features_rdmacm? ( openmpi_fabrics_ofed )
	openmpi_ofed_features_dynamic-sl? ( openmpi_fabrics_ofed )
	openmpi_ofed_features_failover? ( openmpi_fabrics_ofed )"

MPI_UNCLASSED_DEP_STR="
	vt? (
		!dev-libs/libotf
		!app-text/lcdf-typetools
	)"

RDEPEND="
	!sys-cluster/mpich
	!sys-cluster/mpich2
	!sys-cluster/pmix
	dev-libs/libevent:=
	dev-libs/libltdl:0
	<sys-apps/hwloc-2:=
	cuda? ( dev-util/nvidia-cuda-toolkit )
	openmpi_fabrics_ofed? ( sys-cluster/rdma-core )
	openmpi_fabrics_knem? ( sys-cluster/knem )
	openmpi_rm_pbs? ( sys-cluster/torque )
	openmpi_rm_slurm? ( sys-cluster/slurm )
	openmpi_ofed_features_rdmacm? ( sys-cluster/rdma-core )
	"
DEPEND="${RDEPEND}"

pkg_setup() {
	fortran-2_pkg_setup

	if use mpi-threads; then
		echo
		ewarn "WARNING: use of MPI_THREAD_MULTIPLE is still disabled by"
		ewarn "default and officially unsupported by upstream."
		ewarn "You may stop now and set USE=-mpi-threads"
		echo
	fi

	echo
	elog "OpenMPI has an overwhelming count of configuration options."
	elog "Don't forget the EXTRA_ECONF environment variable can let you"
	elog "specify configure options if you find them necessary."
	echo
}

src_prepare() {
	default
	# Necessary for scalibility, see
	# http://www.open-mpi.org/community/lists/users/2008/09/6514.php
	if use threads; then
		echo 'oob_tcp_listen_mode = listen_thread' \
			>> opal/etc/openmpi-mca-params.conf
	fi

	# https://github.com/open-mpi/ompi/issues/163
	eapply "${FILESDIR}"/openmpi-ltdl.patch

	AT_M4DIR=config eautoreconf
}

src_configure() {
	local myconf=(
		--sysconfdir="${EPREFIX}/etc/${PN}"
		--enable-pretty-print-stacktrace
		--enable-orterun-prefix-by-default
		--with-hwloc="${EPREFIX}/usr"
		--with-libltdl=external
		)

	if use mpi-threads; then
		myconf+=(--enable-mpi-threads
			--enable-opal-multi-threads)
	fi

	if use fortran; then
		if [[ $(tc-getFC) =~ g77 ]]; then
			myconf+=(--disable-mpi-f90)
		elif [[ $(tc-getFC) =~ if ]]; then
			# Enabled here as gfortran compile times are huge with this enabled.
			myconf+=(--with-mpi-f90-size=medium)
		fi
	else
		myconf+=(--disable-mpi-f90 --disable-mpi-f77)
	fi

	! use vt && myconf+=(--enable-contrib-no-build=vt)

	econf "${myconf[@]}" \
		$(use_enable cxx mpi-cxx) \
		$(use_with cma) \
		$(use_with cuda cuda "${EPREFIX}"/opt/cuda) \
		$(use_enable romio io-romio) \
		$(use_enable heterogeneous) \
		$(use_enable ipv6) \
		$(use_with openmpi_fabrics_ofed verbs "${EPREFIX}"/usr) \
		$(use_with openmpi_fabrics_knem knem "${EPREFIX}"/usr) \
		$(use_enable openmpi_ofed_features_control-hdr-padding openib-control-hdr-padding) \
		$(use_enable openmpi_ofed_features_connectx-xrc openib-connectx-xrc) \
		$(use_enable openmpi_ofed_features_rdmacm openib-rdmacm) \
		$(use_enable openmpi_ofed_features_dynamic-sl openib-dynamic-sl) \
		$(use_enable openmpi_ofed_features_failover btl-openib-failover) \
		$(use_with openmpi_rm_pbs tm) \
		$(use_with openmpi_rm_slurm slurm)
}

src_install() {
	default

	# From USE=vt see #359917
	rm "${ED}"/usr/share/libtool || die

	# Avoid collisions with libevent
	rm -rf "${ED}"/usr/include/event2 || die
	dodoc README AUTHORS NEWS VERSION
}

src_test() {
	# Doesn't work with the default src_test as the dry run (-n) fails.

	# Do not override malloc during build.  Works around #462602
	emake -j1 check
}
