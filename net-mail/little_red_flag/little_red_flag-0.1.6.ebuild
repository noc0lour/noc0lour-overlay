# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby21 ruby22"

inherit ruby-fakegem

DESCRIPTION="Keep local & remote isync folders in sync"
HOMEPAGE="https://github.com/rlue/little_red_flag"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/listen-3.1:= >=dev-ruby/sys-proctable-1.1"

all_ruby_install() {
all_fakegem_install
}
