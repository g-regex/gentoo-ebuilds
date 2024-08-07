# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9} )
MY_PN="estimator"
MY_PV=${PV/_rc/-rc}
MY_P=${MY_PN}-${MY_PV}

inherit bazel distutils-r1

DESCRIPTION="A high-level TensorFlow API that greatly simplifies machine learning programming"
HOMEPAGE="https://www.tensorflow.org/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

bazel_external_uris="
	https://github.com/bazelbuild/rules_cc/archive/b1c40e1de81913a3c40e5948f78719c28152486d.zip -> bazelbuild-rules_cc-b1c40e1de81913a3c40e5948f78719c28152486d.zip
	https://github.com/bazelbuild/rules_java/archive/7cf3cefd652008d0a64a419c34c13bdca6c8f178.zip -> bazelbuild-rules_java-7cf3cefd652008d0a64a419c34c13bdca6c8f178.zip"

SRC_URI="https://github.com/tensorflow/${MY_PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz
	${bazel_external_uris}"

RDEPEND="
	sci-libs/tensorflow[python,${PYTHON_USEDEP}]
	sci-libs/keras[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND="
	app-arch/unzip
	dev-java/java-config
	>=dev-util/bazel-4.2.2"

S="${WORKDIR}/${MY_P}"

DOCS=( CONTRIBUTING.md README.md )

src_unpack() {
	unpack "${P}.tar.gz"
	bazel_load_distfiles "${bazel_external_uris}"
}

src_prepare() {
	bazel_setup_bazelrc
	default
	python_copy_sources
}

src_compile() {
	export JAVA_HOME=$(java-config --jre-home)

	do_compile() {
		ebazel build //tensorflow_estimator/tools/pip_package:build_pip_package
		ebazel shutdown

		local srcdir="${T}/src-${EPYTHON/./_}"
		mkdir -p "${srcdir}" || die
		bazel-bin/tensorflow_estimator/tools/pip_package/build_pip_package --src "${srcdir}" || die
	}

	python_foreach_impl run_in_build_dir do_compile
}

src_install() {
	do_install() {
		cd "${T}/src-${EPYTHON/./_}" || die
		esetup.py install
		python_optimize
	}
	python_foreach_impl do_install

	cd "${S}" || die
	einstalldocs
}
