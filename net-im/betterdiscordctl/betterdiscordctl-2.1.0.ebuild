# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7

DESCRIPTION="A manager for BetterDiscord on Linux"
HOMEPAGE="https://github.com/bb010g/betterdiscordctl"
SRC_URI="https://api.github.com/repos/bb010g/betterdiscordctl/tarball/v2.1.0 -> betterdiscordctl-2.1.0-c51309a.tar.gz"
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
