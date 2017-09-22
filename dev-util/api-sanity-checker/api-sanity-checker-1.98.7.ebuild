# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit flag-o-matic

DESCRIPTION="API Sanity Checker is an automatic generator of basic unit tests for a shared C/C++ library."
HOMEPAGE="https://lvc.github.io/api-sanity-checker/"
SRC_URI="https://github.com/lvc/api-sanity-checker/archive/${PV}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/abi-compliance-checker
	>=dev-lang/perl-5.8
	dev-util/ctags
	>=sys-devel/gcc-4.9
	"
RDEPEND="${DEPEND}"


src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	mkdir -p ${D}/usr
	emake install DESTDIR=${D}
}
