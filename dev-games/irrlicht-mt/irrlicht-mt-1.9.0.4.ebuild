# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_PN="${PN%-mt}"
MY_PV="$(ver_rs 3 'mt')"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Minetest's fork of dev-games/irrlicht"
HOMEPAGE="https://github.com/minetest/irrlicht"
SRC_URI="https://github.com/minetest/${MY_PN}/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~riscv"

RDEPEND="media-libs/libpng:0=
	sys-libs/zlib
	virtual/jpeg:0
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXxf86vm"
DEPEND="${RDEPEND}
	x11-base/xorg-proto"

S="${WORKDIR}/${MY_P}"
