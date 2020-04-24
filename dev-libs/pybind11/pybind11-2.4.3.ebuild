# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_{6,7,8} )

inherit cmake-utils python-single-r1

DESCRIPTION="Lightweight library that exposes C++ types in Python and vice versa"
HOMEPAGE="https://github.com/wjakob/pybind11"
SRC_URI="https://github.com/pybind/${PN}/archive/v${PV}.tar.gz -> ${P}_cmake.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="info? ( sys-apps/texinfo )"
DEPEND="test? (
			  dev-cpp/eigen
			  dev-cpp/catch
			  )"

src_configure(){
	python_export PYTHON_SITEDIR
	mycmakeargs=(
		-DPYTHON_EXECUTABLE="${PYTHON}"
		-DGR_PYTHON_DIR="${PYTHON_SITEDIR}"
		-DPYBIND11_TEST="$(usex test)"
	)
	cmake-utils_src_configure
}
