# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Hypr is a tiling window manager written in modern C++."
HOMEPAGE="https://github.com/hyprwm/Hypr"
SRC_URI="https://api.github.com/repos/hyprwm/Hypr/tarball/1.1.4 -> hypr-1.1.4-5a29688.tar.gz"
LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/glib
	media-libs/harfbuzz
	dev-cpp/cairomm:0
	dev-cpp/gtkmm:3.0
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-cursor
	x11-libs/libxcb
	
"
DEPEND="${RDEPEND}
"

post_src_unpack() {
	mv hyprwm-Hypr-* ${S}
}


src_install() {
	dobin ${BUILD_DIR}/Hypr
	dodir /usr/share/xsessions
	insinto /usr/share/xsessions
	doins ${S}/example/hypr.desktop
	dodoc ${S}/example/hypr.conf
}



# vim: filetype=ebuild
