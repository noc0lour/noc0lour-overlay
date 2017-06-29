# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A small Perl script which will extract an El Torito boot image"
HOMEPAGE="http://userpages.uni-koblenz.de/~krienke/ftp/noarch/geteltorito/"
SRC_URI="https://raw.githubusercontent.com/ksergey/thinkpad/master/geteltorito.pl"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="dev-lang/perl
	${DEPEND}"

S="${WORKDIR}"

src_unpack() {
    cp "${DISTDIR}/${PN}.pl" "${WORKDIR}" || die
}

src_install() {
	dobin geteltorito.pl
}
