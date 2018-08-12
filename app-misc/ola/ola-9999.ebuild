# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit flag-o-matic eutils python-single-r1

DESCRIPTION="Open Lighting Architecture"
HOMEPAGE="http://www.openlighting.org/"
if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/OpenLightingProject/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/OpenLightingProject/ola/releases/download/${PV}/${P}.tar.gz"
fi

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="examples httpd python"

DEPEND="
	dev-libs/protobuf
	python? (
		${PYTHON_DEPS}
		dev-python/protobuf-python[${PYTHON_USEDEP}]
		)
	dev-util/cppunit
	httpd? ( net-libs/libmicrohttpd[messages] )"
RDEPEND="${DEPEND}"

src_configure() {
	econf	--prefix=/usr \
		--disable-fatal-warnings \
		$(use_enable examples) \
		$(use_enable httpd http) \
		$(use_enable python python-libs)
}
