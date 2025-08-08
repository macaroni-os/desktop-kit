# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_FLAGS_IGNORED="usr/bin/.*"
inherit bash-completion-r1 cargo desktop

DESCRIPTION="A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
HOMEPAGE="https://github.com/wezterm/wezterm"
SRC_URI="
https://api.github.com/repos/wezterm/wezterm/tarball/20240203-110809-5046fc22 -> wezterm-20240203-5046fc2.tar.gz
mirror://macaroni/wezterm-20240203-mark-rust-bundle-5046fc2.tar.xz -> wezterm-20240203-mark-rust-bundle-5046fc2.tar.xz
mirror://macaroni/wezterm-20240203-mark-gitsubmodules-bundle-5046fc2.tar.xz -> wezterm-20240203-mark-gitsubmodules-bundle-5046fc2.tar.xz"
LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
PATCHES=(
	"${FILESDIR}/wezterm-rust-1.85.patch"
)
IUSE="wayland +X"
REQUIRED_USE="|| ( wayland X )"
BDEPEND="dev-util/cmake
	dev-vcs/git
	virtual/pkgconfig
	virtual/rust
	
"
RDEPEND="dev-libs/openssl
	media-libs/fontconfig
	media-libs/mesa[X?,wayland?]
	x11-libs/libxkbcommon[X,wayland?]
	sys-apps/dbus
	wayland? ( dev-libs/wayland )
	X? (
	    x11-themes/hicolor-icon-theme
	    x11-libs/libX11
	    x11-libs/libxkbcommon
	    x11-libs/libxcb:=[xkb]
	    x11-libs/xcb-util
	    x11-libs/xcb-util-image
	    x11-libs/xcb-util-keysyms
	    x11-libs/xcb-util-wm
	    x11-themes/xcursor-themes
	)
	
"
DEPEND="${RDEPEND}
"
src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/wezterm-* ${S} || die
}
# https://wezfurlong.org/wezterm/install/source.html
src_configure() {
	if use X ; then
	  cargo_src_configure --no-default-features --features vendored-fonts
	fi
}
src_install() {
	exeinto /usr/bin
	doexe target/release/wezterm
	doexe target/release/wezterm-gui
	doexe target/release/wezterm-mux-server
	doexe target/release/strip-ansi-escapes
	 newbashcomp assets/shell-completion/bash wezterm
	 insinto /usr/share/fish/vendor_completions.d/
	doins assets/shell-completion/fish
	 insinto /usr/share/zsh/site-functions
	doins assets/shell-completion/zsh
	 newmenu assets/wezterm.desktop org.wezfurlong.wezterm.desktop
	newicon assets/icon/wezterm-icon.svg org.wezfurlong.wezterm.svg
	 insinto /usr/share/metainfo
	newins assets/wezterm.appdata.xml org.wezfurlong.wezterm.appdata.xml
}
pkg_postinst() {
	xdg_icon_cache_update
}
pkg_postrm() {
	xdg_icon_cache_update
}


# vim: filetype=ebuild
