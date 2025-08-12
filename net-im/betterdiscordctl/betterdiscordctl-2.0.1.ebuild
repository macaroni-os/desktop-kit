# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7

DESCRIPTION="A manager for BetterDiscord on Linux"
HOMEPAGE="https://github.com/bb010g/betterdiscordctl"
SRC_URI="https://api.github.com/repos/bb010g/betterdiscordctl/tarball/v2.0.1 -> betterdiscordctl-2.0.1-ed84a05.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv bb010g-betterdiscordctl-* ${S}
}


src_install() {
	dobin betterdiscordctl
}



# vim: filetype=ebuild
