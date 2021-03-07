# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/gnif/vendor-reset.git"
	EGIT_BRANCH="master"
	inherit git-r3
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/gnif/vendor-reset/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Linux kernel vendor specific hardware reset module"
HOMEPAGE="https://github.com/gnif/vendor-reset"
LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
PATCHES=(
	"${FILESDIR}/add_module_target.patch"
)

pkg_setup() {
	local CONFIG_CHECK="FTRACE KPROBES PCI_QUIRKS KALLSYMS FUNCTION_TRACER"
	linux-mod_pkg_setup
	MODULE_NAMES="vendor-reset(pci:${S}:${S})"
	BUILD_PARAMS="KVER=${KV_FULL}"
	[ ${KV_MAJOR} -ge 5 -a ${KV_MINOR} -ge 11 ] && die "Only kernel version up to 5.10 are supported with this kernel module"
}

src_compile() {
	set_arch_to_kernel
	linux-mod_src_compile
}

src_install() {
	set_arch_to_kernel
	linux-mod_src_install

	insinto /etc/modules-load.d/
	newins "${FILESDIR}"/modload.conf vendor-reset.conf
}
