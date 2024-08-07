# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="In-process task scheduler with Cron-like capabilities"
HOMEPAGE="https://github.com/agronholm/apscheduler"
SRC_URI="mirror://pypi/A/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/six-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-1.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		www-servers/tornado[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

# Tests that are known to fail (some may be triggered by network-sandbox).
test_failures=(
	test_add_class_method_job
	test_add_instance_method_job
	test_add_job_conflicting_id
	test_asyncio_executor_shutdown
	test_get_all_jobs
	test_get_next_run_time
	test_get_pending_jobs
	test_get_pending_jobs_subsecond_difference
	test_lookup_job
	test_lookup_nonexistent_job
	test_one_job_fails_to_load
	test_remove_all_jobs
	test_remove_job
	test_remove_nonexistent_job
	test_repr_mongodbjobstore
	test_repr_redisjobstore
	test_repr_zookeeperjobstore
	test_run_coroutine_job
	test_run_coroutine_job_tornado
	test_update_job
	test_update_job_clear_next_runtime
	test_update_job_next_runtime
	test_update_job_nonexistent_job
	test_zookeeper_client_keep_open
	test_zookeeper_client_ref
)

python_prepare_all() {
	sed -i -e /setuptools_scm/d setup.py || die
	while read -r -d ''; do
		sed -Ee "s:$(echo "${test_failures[@]}"| sed 's: :|:g'):_\\0:" -i "${REPLY}" || die
	done < <(grep -rElZ "$(echo "${test_failures[@]}"| sed 's: :|:g')" "${S}")

	# suppress setuptools warning #797751
	sed -e 's|^upload-dir|upload_dir|' -i setup.cfg || die

	distutils-r1_python_prepare_all
}
