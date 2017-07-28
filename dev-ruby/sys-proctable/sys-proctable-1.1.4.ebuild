# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby21 ruby22"
RUBY_FAKEGEM_VERSION="${PV}-universal-linux"

inherit ruby-fakegem

DESCRIPTION="An interface for providing process table information"
HOMEPAGE="https://github.com/djberg96/sys-proctable"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0:= >=dev-ruby/test-unit-0:="

all_ruby_install() {
all_fakegem_install
}
