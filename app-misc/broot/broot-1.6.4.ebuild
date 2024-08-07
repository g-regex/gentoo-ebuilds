# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
adler-1.0.2
adler32-1.2.0
ahash-0.4.7
ahash-0.7.4
aho-corasick-0.7.18
ansi_colours-1.0.4
ansi_term-0.11.0
anyhow-1.0.42
argh-0.1.5
argh_derive-0.1.5
argh_shared-0.1.5
atty-0.2.14
autocfg-1.0.1
base64-0.13.0
bet-1.0.0
bincode-1.3.3
bitflags-1.2.1
bstr-0.2.16
bytemuck-1.7.2
byteorder-1.4.3
cc-1.0.69
cfg-if-1.0.0
char_reader-0.1.0
chrono-0.4.19
clap-2.33.3
cli-log-0.1.0
cli-log-2.0.0
clipboard-win-4.2.1
color_quant-1.1.0
crc32fast-1.2.1
crossbeam-0.8.1
crossbeam-channel-0.5.1
crossbeam-deque-0.8.1
crossbeam-epoch-0.9.5
crossbeam-queue-0.3.2
crossbeam-utils-0.8.5
crossterm-0.19.0
crossterm-0.21.0
crossterm_winapi-0.7.0
crossterm_winapi-0.8.0
csv-1.1.6
csv-core-0.1.10
csv2svg-0.1.5
custom_error-1.9.2
deflate-0.8.6
deser-hjson-1.0.2
directories-3.0.2
directories-next-2.0.0
dirs-sys-0.3.6
dirs-sys-next-0.1.2
either-1.6.1
error-code-2.3.0
fallible-iterator-0.2.0
fallible-streaming-iterator-0.1.9
file-size-1.0.3
flate2-1.0.20
fnv-1.0.7
form_urlencoded-1.0.1
getrandom-0.2.3
gif-0.11.2
git2-0.13.20
glassbench-0.3.0
glob-0.3.0
hashbrown-0.9.1
hashbrown-0.11.2
hashlink-0.6.0
heck-0.3.3
hermit-abi-0.1.19
id-arena-2.2.1
idna-0.2.3
image-0.23.14
indexmap-1.7.0
instant-0.1.10
is_executable-1.0.1
itoa-0.4.7
jobserver-0.1.22
jpeg-decoder-0.1.22
lazy-regex-2.2.1
lazy-regex-proc_macros-2.2.1
lazy_static-1.4.0
lazycell-1.3.0
lfs-core-0.4.2
libc-0.2.98
libgit2-sys-0.12.21+1.1.0
libsqlite3-sys-0.20.1
libz-sys-1.1.3
line-wrap-0.1.1
linked-hash-map-0.5.4
lock_api-0.4.4
log-0.4.14
matches-0.1.8
memchr-2.4.0
memmap-0.7.0
memoffset-0.6.4
minimad-0.7.1
minimad-0.8.0
miniz_oxide-0.3.7
miniz_oxide-0.4.4
mio-0.7.13
miow-0.3.7
ntapi-0.3.6
num-integer-0.1.44
num-iter-0.1.42
num-rational-0.3.2
num-traits-0.2.14
num_cpus-1.13.0
once_cell-1.8.0
onig-6.2.0
onig_sys-69.7.0
open-1.7.1
open-2.0.0
parking_lot-0.11.1
parking_lot_core-0.8.3
pathdiff-0.2.0
percent-encoding-2.1.0
phf-0.9.0
phf_generator-0.9.0
phf_macros-0.9.0
phf_shared-0.9.0
pkg-config-0.3.19
plist-1.2.0
png-0.16.8
ppv-lite86-0.2.10
proc-macro-hack-0.5.19
proc-macro2-1.0.28
proc-status-0.1.1
quote-1.0.9
rand-0.8.4
rand_chacha-0.3.1
rand_core-0.6.3
rand_hc-0.3.1
rayon-1.5.1
rayon-core-1.9.1
redox_syscall-0.2.9
redox_users-0.4.0
regex-1.5.4
regex-automata-0.1.10
regex-syntax-0.6.25
remove_dir_all-0.5.3
rusqlite-0.24.2
ryu-1.0.5
safemem-0.3.3
same-file-1.0.6
scoped_threadpool-0.1.9
scopeguard-1.1.0
secular-1.0.1
serde-1.0.127
serde_derive-1.0.127
serde_json-1.0.66
signal-hook-0.1.17
signal-hook-0.3.9
signal-hook-mio-0.2.1
signal-hook-registry-1.4.0
siphasher-0.3.6
smallvec-1.6.1
splitty-0.1.0
str-buf-1.0.5
strict-0.1.4
strsim-0.8.0
svg-0.8.2
syn-1.0.74
syntect-4.6.0
tempfile-3.2.0
termimad-0.10.3
termimad-0.16.1
terminal-clipboard-0.2.1
termux-clipboard-0.1.0
textwrap-0.11.0
thiserror-1.0.26
thiserror-impl-1.0.26
tiff-0.6.1
time-0.1.43
tinyvec-1.3.1
tinyvec_macros-0.1.0
toml-0.5.8
umask-1.0.0
unicode-bidi-0.3.5
unicode-normalization-0.1.19
unicode-segmentation-1.8.0
unicode-width-0.1.8
unicode-xid-0.2.2
url-2.2.2
users-0.11.0
vcpkg-0.2.15
vec_map-0.8.2
version_check-0.9.3
walkdir-2.3.2
wasi-0.10.2+wasi-snapshot-preview1
weezl-0.1.5
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
x11-clipboard-0.5.2
xcb-0.9.0
xml-rs-0.8.4
yaml-rust-0.4.5
"

PYTHON_COMPAT=( python3_{8..10} )

inherit bash-completion-r1 cargo python-any-r1

DESCRIPTION="A new way to see and navigate directory trees"
HOMEPAGE="https://dystroy.org/broot/ https://github.com/Canop/broot"
SRC_URI="https://github.com/Canop/broot/archive/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)"

LICENSE="Apache-2.0 BSD-2 BSD LGPL-3+ MIT ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE="X"

RDEPEND="
	dev-libs/libgit2:=
	X? ( x11-libs/libxcb:= )
"
DEPEND="${RDEPEND}"
BDEPEND="X? ( ${PYTHON_DEPS} )"

QA_FLAGS_IGNORED="usr/bin/broot"

pkg_setup() {
	use X && python-any-r1_pkg_setup # Used by XCB crate
}

src_configure() {
	local myfeatures=( $(usev X clipboard) )

	cargo_src_configure --no-default-features
}

src_prepare() {
	default

	local mandate=$(date -r man/page +'%Y/%m/%d' || die)
	sed -e "s|#version|${PV}|" \
		-e "s|#date|${mandate}|" \
		man/page > "${T}"/${PN}.1 || die
}

src_install() {
	cargo_src_install

	doman "${T}"/${PN}.1

	local build_dir=( target/$(usex debug{,} release)/build/${PN}-*/out )
	cd ${build_dir[0]} || die

	newbashcomp ${PN}.bash ${PN}
	newbashcomp br.bash br

	insinto /usr/share/zsh/site-functions
	doins _${PN}
	doins _br

	insinto /usr/share/fish/vendor_completions.d
	doins ${PN}.fish
	doins br.fish
}
