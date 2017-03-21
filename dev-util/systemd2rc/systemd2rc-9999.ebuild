# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python3_4 )
GITHUB_USER=pavlix

inherit git-r3

GITHUB_PROJECT="${GITHUB_PROJECT:-"${PN}"}"
EGIT_REPO_URI="${EGIT_REPO_URI:-"https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}.git"}"
HOMEPAGE="https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}"

DESCRIPTION="A tool to convert systemd unit files to OpenRC initscripts"
LICENSE="BSD-2"

SLOT="0"