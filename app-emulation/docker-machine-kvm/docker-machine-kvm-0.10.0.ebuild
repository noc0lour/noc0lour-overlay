# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-base eutils

KEYWORDS="~amd64"
DESCRIPTION="KVM driver for docker-machine"
EGO_PN="github.com/dhiltgen/${PN}/..."
HOMEPAGE="http://${EGO_PN%/*}"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
COMMON_DEPEND="app-emulation/libvirt:=[qemu,virt-network]"
DEPEND=">=dev-lang/go-1.6:=
	${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}"

SRC_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/libvirt/libvirt-go/archive/v3.3.0.tar.gz -> libvirt-go-3.3.0.tar.gz
	https://github.com/docker/machine/archive/v0.10.0.tar.gz -> docker-machine-0.10.0.tar.gz"

get_archive_go_package() {
	local archive=${1} uri x
	for x in ${SRC_URI}; do
		if [[ ${x} == http* ]]; then
			uri=${x}
		elif [[ ${x} == ${archive} ]]; then
			break
		fi
	done
	uri=${uri#https://}
	echo ${uri%/archive/*}
}

unpack_go_packages() {
	local go_package x
	# Unpack packages to appropriate locations for GOPATH
	for x in ${A}; do
		unpack ${x}
		if [[ ${x} == *.tar.gz ]]; then
			go_package=$(get_archive_go_package ${x})
			mkdir -p src/${go_package%/*}
			mv ${go_package##*/}-* src/${go_package} || die
		fi
	done
}

src_unpack() {
	mkdir "${S}" && cd "${S}" || die
	unpack_go_packages
}

src_prepare() {
	epatch "${FILESDIR}/001-fix-libvirt-go-lxc.patch"
	eapply_user
}

src_compile() {
	export GOPATH=${S}
	cd "${S}"/src/${EGO_PN%/*}/cmd/docker-machine-driver-kvm || die
	emake || die
}

src_install() {
	dobin "${S}/src/${EGO_PN%/*}/cmd/docker-machine-driver-kvm/${PN/kvm/driver-kvm}"
	dodoc "${S}/src/${EGO_PN%/*}/README.md"
}
