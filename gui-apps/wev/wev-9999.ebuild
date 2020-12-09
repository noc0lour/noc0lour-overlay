# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Like xev but for wayland"
HOMEPAGE="https://git.sr.ht/~sircmpwn/wev"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~sircmpwn/wev"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

BDEPEND="
	sys-devel/make
	virtual/pkgconfig
"

DEPEND="
	dev-libs/wayland-protocols
	dev-libs/wayland
"

RDEPEND="${DEPEND}"

if [[ ${PV} != 9999 ]]; then
	S="${WORKDIR}/${PN^}-${PV}"
fi

src_compile() {
	emake PREFIX=/ || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr/" install
	einstalldocs
}
