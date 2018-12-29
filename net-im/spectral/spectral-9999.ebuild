# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="A glossy cross-platform client for Matrix based on Qt."
HOMEPAGE="https://gitlab.com/b0/spectral"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/b0/spectral"
else
	SRC_URI="https://gitlab.com/b0/spectral/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/libQMatrixClient
	dev-qt/sortfilterproxymodel
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtquickcontrols:5
	dev-qt/qtwidgets:5
	dev-qt/qtmultimedia:5
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure(){
	eqmake5 PREFIX="/usr" USE_SYSTEM_QMATRIXCLIENT="true" USE_SYSTEM_SORTFILTERPROXYMODEL="true" INSTALL_ROOT=.
}

src_install(){
	emake install INSTALL_ROOT="${D}"
}
