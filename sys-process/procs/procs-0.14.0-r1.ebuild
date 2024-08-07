# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.6.3

EAPI=8

CRATES="
	adler-1.0.2
	aho-corasick-0.7.20
	android_system_properties-0.1.5
	anyhow-1.0.69
	async-channel-1.7.1
	async-executor-1.4.1
	async-global-executor-2.3.0
	async-io-1.9.0
	async-lock-2.5.0
	async-std-1.12.0
	async-task-4.3.0
	atomic-waker-1.0.0
	atty-0.2.14
	autocfg-1.1.0
	base64-0.13.0
	bindgen-0.64.0
	bitflags-1.3.2
	blocking-1.2.0
	bumpalo-3.11.1
	byte-unit-4.0.18
	byteorder-1.4.3
	bytes-1.2.1
	cache-padded-1.2.0
	cc-1.0.73
	cexpr-0.6.0
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.23
	clang-sys-1.4.0
	clap-3.2.23
	clap_complete-3.2.5
	clap_derive-3.2.18
	clap_lex-0.2.4
	codespan-reporting-0.11.1
	concurrent-queue-1.2.4
	console-0.15.5
	core-foundation-sys-0.8.3
	crc32fast-1.3.2
	crossbeam-channel-0.5.7
	crossbeam-utils-0.8.12
	crossterm-0.19.0
	crossterm-0.22.1
	crossterm_winapi-0.7.0
	crossterm_winapi-0.9.0
	ctor-0.1.26
	cxx-1.0.79
	cxx-build-1.0.79
	cxxbridge-flags-1.0.79
	cxxbridge-macro-1.0.79
	directories-4.0.1
	dirs-4.0.0
	dirs-sys-0.3.7
	dockworker-0.1.2
	either-1.8.0
	encode_unicode-0.3.6
	errno-0.2.8
	errno-dragonfly-0.1.2
	event-listener-2.5.3
	fastrand-1.8.0
	filetime-0.2.17
	flate2-1.0.24
	fnv-1.0.7
	form_urlencoded-1.1.0
	futures-0.3.24
	futures-channel-0.3.24
	futures-core-0.3.24
	futures-executor-0.3.24
	futures-io-0.3.24
	futures-lite-1.12.0
	futures-macro-0.3.24
	futures-sink-0.3.24
	futures-task-0.3.24
	futures-util-0.3.24
	getch-0.3.1
	getrandom-0.2.7
	glob-0.3.0
	gloo-timers-0.2.4
	hashbrown-0.12.3
	heck-0.4.0
	hermit-abi-0.1.19
	hex-0.4.3
	http-0.2.8
	http-body-0.4.5
	httparse-1.8.0
	httpdate-1.0.2
	hyper-0.14.20
	hyperlocal-0.8.0
	iana-time-zone-0.1.51
	iana-time-zone-haiku-0.1.1
	idna-0.3.0
	indexmap-1.9.1
	instant-0.1.12
	io-lifetimes-1.0.3
	itoa-1.0.4
	js-sys-0.3.60
	kv-log-macro-1.0.7
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.139
	libloading-0.7.3
	libproc-0.13.0
	link-cplusplus-1.0.7
	linux-raw-sys-0.1.3
	lock_api-0.4.9
	log-0.4.17
	memchr-2.5.0
	memoffset-0.6.5
	memoffset-0.7.1
	mime-0.3.16
	minimal-lexical-0.2.1
	miniz_oxide-0.5.4
	minus-5.2.0
	mio-0.7.14
	mio-0.8.4
	miow-0.3.7
	named_pipe-0.4.1
	nix-0.24.2
	nix-0.26.2
	nom-7.1.1
	nom8-0.2.0
	ntapi-0.3.7
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.13.1
	once_cell-1.17.1
	os_str_bytes-6.3.0
	pager-0.16.1
	parking-2.0.0
	parking_lot-0.11.2
	parking_lot-0.12.1
	parking_lot_core-0.8.5
	parking_lot_core-0.9.4
	peeking_take_while-0.1.2
	percent-encoding-2.2.0
	pin-project-1.0.12
	pin-project-internal-1.0.12
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	polling-2.3.0
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.47
	procfs-0.15.1
	quote-1.0.21
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.6.0
	regex-syntax-0.6.27
	rustc-hash-1.1.0
	rustix-0.36.4
	ryu-1.0.11
	scopeguard-1.1.0
	scratch-1.0.2
	serde-1.0.152
	serde_derive-1.0.152
	serde_json-1.0.86
	serde_spanned-0.6.1
	shlex-1.1.0
	signal-hook-0.1.17
	signal-hook-0.3.15
	signal-hook-mio-0.2.3
	signal-hook-registry-1.4.0
	slab-0.4.7
	smallvec-1.10.0
	socket2-0.4.7
	static_assertions-1.1.0
	strsim-0.10.0
	syn-1.0.104
	tar-0.4.38
	termbg-0.4.3
	termcolor-1.1.3
	termios-0.3.3
	textwrap-0.13.4
	textwrap-0.16.0
	thiserror-1.0.37
	thiserror-impl-1.0.37
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	tokio-1.25.0
	tokio-macros-1.8.0
	toml-0.7.2
	toml_datetime-0.6.1
	toml_edit-0.19.3
	tower-service-0.3.2
	tracing-0.1.37
	tracing-core-0.1.30
	try-lock-0.2.3
	unicode-bidi-0.3.8
	unicode-ident-1.0.5
	unicode-normalization-0.1.22
	unicode-width-0.1.10
	unix_socket-0.5.0
	url-2.3.1
	users-0.11.0
	utf8-width-0.1.6
	value-bag-1.0.0-alpha.9
	version_check-0.9.4
	waker-fn-1.1.0
	want-0.3.0
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.83
	wasm-bindgen-backend-0.2.83
	wasm-bindgen-futures-0.4.33
	wasm-bindgen-macro-0.2.83
	wasm-bindgen-macro-support-0.2.83
	wasm-bindgen-shared-0.2.83
	web-sys-0.3.60
	wepoll-ffi-0.1.2
	which-4.4.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.36.1
	windows-sys-0.42.0
	windows_aarch64_gnullvm-0.42.0
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.42.0
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.42.0
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.42.0
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.42.0
	windows_x86_64_gnullvm-0.42.0
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.42.0
	xattr-0.2.3
"

inherit bash-completion-r1 cargo

DESCRIPTION="A modern replacement for ps"
HOMEPAGE="https://github.com/dalance/procs"
SRC_URI="
	https://github.com/dalance/procs/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD ISC MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED="usr/bin/procs"

src_install() {
	cargo_src_install

	target/$(usex debug debug release)/procs --gen-completion bash || die
	newbashcomp procs.bash procs

	target/$(usex debug debug release)/procs --gen-completion zsh || die
	insinto /usr/share/zsh/site-functions
	doins _procs

	target/$(usex debug debug release)/procs --gen-completion fish || die
	insinto /usr/share/fish/vendor_completions.d
	doins procs.fish
}
