# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A library to create panels and other desktop components for Wayland using the Layer Shell protocol"
HOMPAGE="https://github.com/wmww/gtk-layer-shell"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wmww/${PN}.git"
else
	SRC_URI="https://github.com/wmww/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-libs/wayland
	x11-libs/gtk+[wayland]
	dev-libs/gobject-introspection
"

RDPEND="${DEPEND}"

if [[ ${PV} != 9999 ]]; then
	S="${WORKDIR}/${PN}-${PV}"
fi
