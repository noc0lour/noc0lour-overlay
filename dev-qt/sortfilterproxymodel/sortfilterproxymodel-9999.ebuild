# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="An implementation of QSortFilterProxyModel conveniently exposed for QML."
HOMEPAGE="https://gitlab.com/b0/SortFilterProxyModel"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/b0/SortFilterProxyModel"
else
	SRC_URI="https://gitlab.com/b0/SortFilterProxyModel/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtquickcontrols:5
	dev-qt/qtdeclarative:5
"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake5 PREFIX="${D}/usr"
}
