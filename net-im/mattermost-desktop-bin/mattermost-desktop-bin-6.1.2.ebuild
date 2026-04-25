# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="
  opt/mattermost-desktop/mattermost-desktop
  opt/mattermost-desktop/libnode.so
  opt/mattermost-desktop/libffmpeg.so
  opt/mattermost-desktop/libGLESv2.so
  opt/mattermost-desktop/libEGL.so
  opt/mattermost-desktop/libvk_swiftshader.so
  opt/mattermost-desktop/libvulkan.so.1
  opt/mattermost-desktop/resources/*
"

inherit desktop xdg

DESCRIPTION="Mattermost Desktop application"
HOMEPAGE="https://mattermost.com/"
SRC_URI="
amd64? ( https://github.com/mattermost/desktop/releases/download/v6.1.2/mattermost-desktop-6.1.2-linux-x64.tar.gz -> mattermost-desktop-6.1.2.linux-x64.tar.gz )
arm64? ( https://github.com/mattermost/desktop/releases/download/v6.1.2/mattermost-desktop-6.1.2-linux-arm64.tar.gz -> mattermost-desktop-6.1.2.linux-arm64.tar.gz )"
LICENSE="Apache-2.0 GPL-2+ LGPL-2.1+ MIT"
SLOT="0"
KEYWORDS="*"
DOCS=(
	NOTICE.txt
)
RDEPEND="app-accessibility/at-spi2-core[X]
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	dev-libs/wayland
	media-libs/alsa-lib
	media-libs/mesa
	net-print/cups
	sys-apps/dbus
	sys-libs/glibc
	x11-libs/cairo
	x11-libs/gtk+:3[X]
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libdrm
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/pango
	
"
S="${WORKDIR}"
src_install() {
	local MY_PN="mattermost-desktop"
	if use amd64; then
	  cd mattermost-desktop-*-linux-x64 || die
	elif use arm64; then
	  cd mattermost-desktop-*-linux-arm64 || die
	fi
	newicon app_icon.png ${MY_PN}.png
	insinto "/opt/${MY_PN}/locales"
	doins locales/*.pak
	insinto "/opt/${MY_PN}/resources"
	doins -r resources/*.asar*
	insinto "/opt/${MY_PN}"
	doins *.pak *.bin *.dat
	exeinto "/opt/${MY_PN}"
	doexe *.so *.so.* "${MY_PN}"
	dosym "/opt/${MY_PN}/${MY_PN}" "/usr/bin/${MY_PN}"
	make_desktop_entry "${MY_PN}" Mattermost "${MY_PN}"
	einstalldocs
}


# vim: filetype=ebuild
