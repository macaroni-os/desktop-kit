# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="/opt/slack/*"
inherit desktop gnome3 pax-utils unpacker

DESCRIPTION="Team collaboration tool"
HOMEPAGE="http://www.slack.com/"
SRC_URI="https://downloads.slack-edge.com/desktop-releases/linux/x64/4.51.191/slack-desktop-4.51.191-amd64.deb -> slack-desktop-4.51.191-amd64.deb"
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="*"
IUSE="amd64 ayatana gnome-keyring pax_kernel"
RDEPEND="dev-libs/atk
	dev-libs/expat
	dev-libs/glib
	dev-libs/nspr
	dev-libs/nss
	gnome-base/gconf
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	net-misc/curl
	net-print/cups
	sys-apps/dbus
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libxkbfile
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-libs/pango
	ayatana? ( dev-libs/libappindicator )
	gnome-keyring? ( app-crypt/libsecret )
	
"
S="${WORKDIR}"
src_prepare() {
	default
	if use ayatana ; then
		sed -i '/Exec/s|=|=env XDG_CURRENT_DESKTOP=Unity |' \
			usr/share/applications/slack.desktop \
			|| die "sed failed for slack.desktop"
	fi
}
src_configure() {
	:
}
src_install() {
	doicon usr/share/pixmaps/slack.png
	doicon -s 512 usr/share/pixmaps/slack.png
	domenu usr/share/applications/slack.desktop

	insinto /opt/slack
	doins -r usr/lib/slack/.
	fperms +x /opt/slack/slack
	fperms +x /opt/slack/chrome_crashpad_handler
	fperms 4711 /opt/slack/chrome-sandbox
	dosym ../../opt/slack/slack usr/bin/slack

	use pax_kernel && pax-mark -m "${ED%/}"/opt/slack/slack
}


# vim: filetype=ebuild
