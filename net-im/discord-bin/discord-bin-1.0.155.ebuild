# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="/opt/discord/*"
inherit desktop gnome3 pax-utils unpacker

DESCRIPTION="Discord Installer"
HOMEPAGE="https://discordapp.com"
SRC_URI="https://stable.dl2.discordapp.net/apps/linux/1.0.155/discord-1.0.155.deb -> discord-1.0.155.deb"
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="*"
IUSE="amd64"
RDEPEND="dev-libs/atk
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/fontconfig:1.0
	media-libs/freetype:2
	net-print/cups
	sys-apps/dbus
	sys-libs/libcxx
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/libxkbcommon
	x11-libs/pango
	
"
S="${WORKDIR}"
src_prepare() {
	default
	sed -i \
		-e "s:/usr/share/discord/Discord.*:/opt/discord/Discord:g" \
		-e "s:discord:discord:g" \
		usr/share/discord/discord.desktop || die
	install -d "${S}/opt"
	mv -v "${S}/usr/share/discord" "${S}/opt/discord" || die
}
src_configure() {
	:
}
src_install() {
	doicon opt/discord/discord.png
	domenu opt/discord/discord.desktop
	insinto /opt/discord
	doins -r opt/discord/.
	doins -r usr/bin
	fperms +x /opt/discord/bin/discord
	dosym /opt/discord/usr/bin/discord usr/bin/discord
	pax-mark -m "${ED%/}"/opt/discord/discord
}


# vim: filetype=ebuild
