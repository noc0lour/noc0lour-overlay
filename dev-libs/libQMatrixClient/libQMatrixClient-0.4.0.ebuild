# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A Qt5 library to write cross-platfrom clients for Matrix"
HOMEPAGE="https://github.com/QMatrixClient/libqmatrixclient"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/QMatrixClient/libqmatrixclient"
else
	SRC_URI="https://github.com/QMatrixClient/libqmatrixclient/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-qt/qtcore:5
	dev-qt/qtnetwork:5
	dev-qt/qtgui:5
"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/${P,,}

src_prepare() {
	eapply_user
	cmake-utils_src_configure
}
