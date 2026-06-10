# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit meson python-any-r1 systemd

DESCRIPTION="Desktop integration portal"
HOMEPAGE="https://flatpak.github.io/xdg-desktop-portal/"
SRC_URI="https://github.com/flatpak/xdg-desktop-portal/releases/download/1.22.0/xdg-desktop-portal-1.22.0.tar.xz -> xdg-desktop-portal-1.22.0.tar.xz"
SLOT="0"
KEYWORDS="*"
IUSE="geolocation flatpak seccomp systemd udev"
REQUIRED_USE="flatpak? ( seccomp )
"
BDEPEND="dev-util/gdbus-codegen
	dev-python/docutils
	sys-devel/gettext
	virtual/pkgconfig
	
"
RDEPEND="dev-libs/glib:2
	dev-libs/json-glib
	media-video/pipewire:=
	sys-fs/fuse:3=
	x11-libs/gdk-pixbuf
	geolocation? ( app-misc/geoclue:2.0 )
	flatpak? ( sys-apps/flatpak )
	seccomp? ( sys-apps/bubblewrap )
	systemd? ( sys-apps/systemd )
	udev? ( dev-libs/libgudev )
	sys-apps/dbus
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	# Avoid issues with sandbox with gst-inspect-1.0
	addpredict /dev/dri
	addpredict /proc/self/task
	 local emesonargs=(
	    -Ddbus-service-dir="${EPREFIX}/usr/share/dbus-1/services"
	    -Dsystemd-user-unit-dir="$(systemd_get_userunitdir)"
	    $(meson_feature flatpak flatpak-interfaces)
	    $(meson_feature geolocation geoclue)
	    $(meson_feature udev gudev)
	    $(meson_feature seccomp sandboxed-image-validation)
	    $(meson_feature seccomp sandboxed-sound-validation)
	    -Dsandboxed-sound-validation=disabled
	    $(meson_feature systemd)
	    -Ddocumentation=disabled
	    -Ddatarootdir="${EPREFIX}/usr/share"
	    -Dman-pages=enabled
	    -Dinstalled-tests=false
	    -Dtests=disabled
	)
	meson_src_configure
}


# vim: filetype=ebuild
