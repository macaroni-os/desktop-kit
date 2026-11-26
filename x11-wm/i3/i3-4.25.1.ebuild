# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson

DESCRIPTION="A tiling window manager for X11"
HOMEPAGE="https://i3wm.org/"
SRC_URI="https://api.github.com/repos/i3/i3/tarball/refs/tags/4.25.1 -> i3-4.25.1-254879d.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="doc"
BDEPEND="virtual/pkgconfig
"
RDEPEND="dev-libs/libev
	dev-libs/libpcre2
	dev-libs/yajl
	x11-libs/cairo[X,xcb(+)]
	x11-libs/libxcb[xkb]
	x11-libs/libxkbcommon[X]
	x11-libs/pango[X]
	x11-libs/startup-notification
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-xrm
	x11-misc/xkeyboard-config
	dev-lang/perl
	dev-perl/AnyEvent-I3
	dev-perl/JSON-XS
	
"
DEPEND="${RDEPEND}
	doc? (
	  app-text/asciidoc
	  app-text/xmlto
	  dev-lang/perl
	)
	
"

post_src_unpack() {
	mv i3-i3-* ${S}
}


src_prepare() {
	default
	 cat > "${T}"/i3wm <<- EOF || die
	  #!/bin/sh
	  exec /usr/bin/i3
	EOF
}

src_configure() {
	local emesonargs=(
	  -Ddocdir=/usr/share/doc/i3-4.25.1
	  $(meson_use doc docs)
	  $(meson_use doc mans)
	)
	 meson_src_configure
}

src_install() {
	meson_src_install
	 exeinto /etc/X11/Sessions
	doexe "${T}"/i3wm
}

pkg_postinst() {
	# Only show the elog information on a new install
	if [[ ! ${REPLACING_VERSIONS} ]]; then
	  elog "There are several packages that you may find useful with ${PN} and"
	  elog "their usage is suggested by the upstream maintainers, namely:"
	  elog "  x11-misc/dmenu"
	  elog "  x11-misc/i3status"
	  elog "  x11-misc/i3lock"
	  elog "Please refer to their description for additional info."
	fi
}



# vim: filetype=ebuild
