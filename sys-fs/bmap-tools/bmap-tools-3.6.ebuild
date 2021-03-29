# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python3_8 python3_9)

inherit distutils-r1

DESCRIPTION="Create and apply sparse images of block devices"
HOMEPAGE="https://source.tizen.org/documentation/reference/bmaptool/bmap-tools-project"
SRC_URI="https://github.com/intel/bmap-tools/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPENDS="dev-python/pygpgme"
