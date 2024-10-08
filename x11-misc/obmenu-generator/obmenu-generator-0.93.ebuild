# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A fast pipe/static menu generator for the Openbox Window Manager"
HOMEPAGE="https://github.com/trizen/obmenu-generator"
SRC_URI="https://github.com/trizen/obmenu-generator/tarball/a960c7e734a3755d39516a0f3cb788d6a0fc58ab -> obmenu-generator-0.93-a960c7e.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	>=dev-lang/perl-5.14.0
	dev-perl/Gtk3
	dev-perl/Data-Dump
	>=dev-perl/Linux-DesktopFiles-0.90.0
	dev-perl/File-DesktopEntry
	x11-wm/openbox
"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv trizen-obmenu-generator* "${S}" || die
	fi
}

src_install() {
	dobin ${PN}

	insinto /etc/xdg/obmenu-generator
	doins schema.pl

	dodoc README.md
}