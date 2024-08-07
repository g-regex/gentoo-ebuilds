# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{9..11} )

CRATES="
	arrayref-0.3.6
	arrayvec-0.7.2
	autocfg-1.1.0
	bitflags-1.3.2
	blake3-1.3.3
	block-buffer-0.10.3
	cc-1.0.78
	cfg-if-1.0.0
	constant_time_eq-0.2.4
	crossbeam-channel-0.5.6
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.13
	crossbeam-utils-0.8.14
	crypto-common-0.1.6
	digest-0.10.6
	either-1.8.0
	generic-array-0.14.6
	hermit-abi-0.1.19
	hex-0.4.3
	indoc-0.3.6
	indoc-impl-0.3.6
	instant-0.1.12
	libc-0.2.138
	lock_api-0.4.9
	memoffset-0.7.1
	num_cpus-1.14.0
	once_cell-1.16.0
	parking_lot-0.11.2
	parking_lot_core-0.8.6
	paste-0.1.18
	paste-impl-0.1.18
	proc-macro-hack-0.5.19
	proc-macro2-1.0.47
	pyo3-0.15.2
	pyo3-build-config-0.15.2
	pyo3-macros-0.15.2
	pyo3-macros-backend-0.15.2
	quote-1.0.21
	rayon-1.6.1
	rayon-core-1.10.1
	redox_syscall-0.2.16
	scopeguard-1.1.0
	smallvec-1.10.0
	subtle-2.4.1
	syn-1.0.105
	typenum-1.16.0
	unicode-ident-1.0.5
	unindent-0.1.10
	version_check-0.9.4
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo distutils-r1

DESCRIPTION="Python bindings for the BLAKE3 cryptographic hash function"
HOMEPAGE="
	https://github.com/oconnor663/blake3-py/
	https://pypi.org/project/blake3/
"
SRC_URI="
	https://github.com/oconnor663/blake3-py/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
	$(cargo_crate_uris)
"

LICENSE="|| ( CC0-1.0 Apache-2.0 )"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD-2 BSD MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
	)
"

QA_FLAGS_IGNORED="usr/lib.*/py.*/site-packages/blake3/blake3.*.so"

distutils_enable_tests pytest
