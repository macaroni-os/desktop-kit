# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="/usr/*"
inherit prefix rpm toolchain-funcs xdg-utils

DESCRIPTION="A full office productivity suite. Binary package"
HOMEPAGE="https://www.libreoffice.org"
SRC_URI="
amd64? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.5/rpm/x86_64/LibreOffice_25.8.5.1_Linux_x86-64_rpm.tar.gz -> libreoffice-bin-25.8.5.1_Linux_x86-64_rpm.tar.gz )
arm64? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.5/rpm/aarch64/LibreOffice_25.8.5.1_Linux_aarch64_rpm.tar.gz -> libreoffice-bin-25.8.5.1_Linux_aarch64_rpm.tar.gz )"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="amd64 arm64 gnome +gtk java kde"
REQUIRED_USE="gnome? ( gtk )
"
RESTRICT="strip"
RDEPEND="app-text/libexttextcat
	app-text/libmwaw
	dev-libs/icu
	media-gfx/graphite2
	media-libs/harfbuzz[graphite,icu]
	app-crypt/mit-krb5
	dev-libs/glib
	dev-libs/nspr
	dev-libs/nss
	media-libs/fontconfig
	media-libs/freetype
	media-libs/gst-plugins-base
	media-libs/gstreamer
	net-dns/avahi
	net-print/cups
	sys-apps/dbus
	sys-devel/gcc
	sys-libs/e2fsprogs-libs
	sys-libs/glibc
	sys-libs/zlib
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libXext
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXrender
	app-arch/unzip
	app-arch/zip
	media-fonts/liberation-fonts
	java? ( virtual/jre )
	gtk? (
	  dev-libs/atk
	  x11-libs/cairo
	  x11-libs/gdk-pixbuf
	  x11-libs/gtk+
	  x11-libs/pango
	)
	kde? (
	  dev-qt/qtcore:5
	  dev-qt/qtgui:5
	  dev-qt/qtwidgets:5
	  dev-qt/qtx11extras:5
	  kde-frameworks/kconfig:5
	  kde-frameworks/kcoreaddons:5
	  kde-frameworks/ki18n:5
	  kde-frameworks/kio:5
	  kde-frameworks/kwindowsystem:5
	)
	
"
DEPEND="app-arch/rpm
	
"
PDEPEND="=app-office/libreoffice-l10n-25.8.5.1*
	
"
S="${WORKDIR}"
src_prepare() {
	local major=25.8
	cp "${FILESDIR}"/50-${PN} "${T}"
	eprefixify "${T}"/50-${PN}
	default
	 local rpmdir
	use amd64 && rpmdir="LibreOffice_${PV}_Linux_x86-64_rpm/RPMS/"
	[[ -d ${rpmdir} ]] || die "Missing directory: ${rpmdir}"
	 # Unpack RPMs but consider USE flags
	for rpms in ./${rpmdir}/*.rpm; do
	  if [[ ${rpms} == "./${rpmdir}/libobasis${major}-kde-integration-${PV}-${major}.x86_64.rpm" ]]; then
	    use kde && rpm_unpack ${rpms}
	  elif [[ ${rpms} == "./${rpmdir}/libobasis${major}-gnome-integration-${PV}-${major}.x86_64.rpm" ]]; then
	    use gtk && rpm_unpack ${rpms}
	  else
	    rpm_unpack ${rpms}
	  fi
	done
	 # Remove files that require java if USE flag not set
	use java || rm -f ./opt/libreoffice${major}/program/libofficebean.so
}
src_configure() { :; }
src_compile() { :; }
src_install() {
	local major=25.8
	local progdir=/usr/$(get_libdir)/libreoffice
	dodir ${progdir}
	mv "${S}"/opt/libreoffice"${major}"/* "${ED}"/"${progdir}"/
	rm ./usr/bin/libreoffice"${major}"
	dosym "${progdir}"/program/soffice /usr/bin/libreoffice"${major}"
	dosym "${progdir}"/program/soffice /usr/bin/libreoffice
	dosym "${progdir}"/program/soffice /usr/bin/loffice
	dosym "${progdir}"/program/soffice /usr/bin/soffice
	for prog in base impress calc math writer draw; do
	  dosym "${progdir}"/program/s"${prog}" /usr/bin/lo"${prog}"
	done
	rm ./usr/share/applications/*
	mkdir -p "${ED}"/usr/share/applications
	for prog in base impress startcenter calc math writer draw xsltfilter; do
	  cp "${ED}"/"${progdir}"/share/xdg/"${prog}".desktop "${ED}"/usr/share/applications/libreoffice"${major}"-"${prog}".desktop
	done
	doins -r usr
	# prevent revdep-rebuild from attempting to rebuild all the time
	insinto /etc/revdep-rebuild && doins "${T}/50-${PN}"
}
pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	use java || \
	  ewarn 'If you plan to use lbase application you should enable java or you will get various crashes.'
}
pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}


# vim: filetype=ebuild
