# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A Qt5 desktop Matrix client"
HOMEPAGE="https://github.com/QMatrixClient/Quaternion"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/QMatrixClient/Quaternion"
else
	SRC_URI="https://github.com/QMatrixClient/Quaternion/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

S=${WORKDIR}/${P}

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-libs/libQMatrixClient
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtwidgets:5
	dev-qt/qtnetwork:5
	dev-qt/qtquickcontrols:5
	dev-qt/qtgui:5
"
RDEPEND="${DEPEND}"

src_prepare(){
	eapply_user
	cmake-utils_src_configure
}
