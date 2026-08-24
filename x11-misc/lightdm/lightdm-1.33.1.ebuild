# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit autotools flag-o-matic pam qmake-utils systemd user vala xdg-utils

DESCRIPTION="A lightweight display manager"
HOMEPAGE="https://github.com/ubuntu/lightdm"
SRC_URI="https://api.github.com/repos/ubuntu/lightdm/tarball/1.33.1 -> lightdm-1.33.1-73987eb.tar.gz"
LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="*"
DOCS=(
	NEWS
)
IUSE="+X audit elogind +gnome +gtk +introspection non_root qt5 +qt6 systemd vala"
REQUIRED_USE="?? ( elogind systemd )
"
BDEPEND="app-text/yelp-tools
	dev-util/gtk-doc-am
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig
	vala? ( $(vala_depend) )
	
"
RDEPEND="${DEPEND}
	>=sys-auth/pambase-20101024-r2
	elogind? ( sys-auth/elogind[pam] )
	X? ( x11-base/xorg-server )
	
"
DEPEND=">=dev-libs/glib-2.44.0:2
	dev-libs/libgcrypt
	dev-libs/libxml2:2
	virtual/pam
	x11-libs/libX11
	x11-libs/libXdmcp
	x11-libs/libxcb
	>=x11-libs/libxklavier-5
	audit? ( sys-process/audit )
	gnome? (
	  gnome-base/gnome-common
	  sys-apps/accountsservice
	)
	introspection? ( >=dev-libs/gobject-introspection-1 )
	qt5? (
	  dev-qt/qtcore:5
	  dev-qt/qtdbus:5
	  dev-qt/qtgui:5
	)
	qt6? (
	  dev-qt/qtbase:6[gui]
	)
	
"
PDEPEND="gtk? ( x11-misc/lightdm-gtk-greeter )
	
"

post_src_unpack() {
	mv ubuntu-lightdm-* ${S}
}


pkg_setup() {
	export LIGHTDM_USER=${LIGHTDM_USER:-lightdm}
	if use non_root ; then
	  enewgroup ${LIGHTDM_USER} 134
	  enewgroup video 27
	  enewuser ${LIGHTDM_USER} 134 -1 /var/lib/${LIGHTDM_USER} ${LIGHTDM_USER},video
	  esethome ${LIGHTDM_USER} /var/lib/${LIGHTDM_USER}
	fi
}
src_prepare() {
	xdg_environment_reset
	 sed -i -e 's:getgroups:lightdm_&:' tests/src/libsystem.c || die
	sed -i -e '/minimum-uid/s:500:1000:' data/users.conf || die
	 einfo "Fixing the session-wrapper variable in lightdm.conf"
	sed -i -e \
	  "/^#session-wrapper/s@^.*@session-wrapper=/etc/${PN}/Xsession@" \
	  data/lightdm.conf || die "Failed to fix lightdm.conf"
	 if use qt5 ; then
	  grep -q 'QT5_VALIDATE_MOC(MOC5)' configure.ac \
	    || die "MOC5 detection hook not found, sed needs updating"
	  sed -i -e \
	    "/QT5_VALIDATE_MOC(MOC5)/a AC_SUBST(MOC5,$(qt5_get_bindir)/moc)" \
	    configure.ac || die
	fi
	if use qt6 ; then
	  grep -q 'QT6_VALIDATE_MOC(MOC6)' configure.ac \
	    || die "MOC6 detection hook not found, sed needs updating"
	  sed -i -e \
	    "/QT6_VALIDATE_MOC(MOC6)/a AC_SUBST(MOC6,$(qt6_get_libdir)/libexec/moc)" \
	    configure.ac || die
	fi
	 default
	 sed -i /"@YELP_HELP_RULES@"/d help/Makefile.am || die
	 use vala && vala_src_prepare
	 eautoreconf
}
src_configure() {
	local _greeter _session _user
	_greeter=${LIGHTDM_GREETER:=lightdm-gtk-greeter}
	_session=${LIGHTDM_SESSION:=gnome}
	_user="$(usex non_root "${LIGHTDM_USER}" root)"
	einfo "Default greeter: ${_greeter}"
	einfo "Default session: ${_session}"
	einfo "Greeter user: ${_user}"
	 if use qt5 && ! use qt6 ; then
	  append-cxxflags -std=c++11
	fi
	 local myeconfargs=(
	  --localstatedir=/var
	  --disable-static
	  --disable-tests
	  $(use_enable audit libaudit)
	  $(use_enable introspection)
	  $(use_enable qt5 liblightdm-qt5)
	  $(use_enable qt6 liblightdm-qt6)
	  $(use_enable vala)
	  --with-user-session=${_session}
	  --with-greeter-session=${_greeter}
	  --with-greeter-user=${_user}
	)
	econf "${myeconfargs[@]}"
}
src_install() {
	default
	 if [[ -d ${ED}/etc/apparmor.d ]]; then
	  rm -r "${ED}/etc/apparmor.d" || die \
	    "Failed to remove apparmor profiles"
	fi
	 insinto /etc/${PN}
	doins data/{${PN},keys}.conf
	doins "${FILESDIR}"/Xsession
	fperms +x /etc/${PN}/Xsession
	keepdir /var/lib/${PN}-data
	 find "${ED}" -type f \( -name '*.a' -o -name "*.la" \) -delete || die
	 if [[ -d ${ED}/etc/init ]]; then
	  rm -r "${ED}/etc/init" || die "Failed to remove upstart job"
	fi
	 rm -r "${ED}"/etc/pam.d/${PN}{,-greeter} || die
	pamd_mimic system-local-login ${PN} auth account password session #372229
	pamd_mimic system-local-login ${PN}-greeter auth account password session #372229
	dopamd "${FILESDIR}"/${PN}-autologin #390863, #423163
	 if use systemd ; then
	  systemd_dounit "${FILESDIR}/${PN}.service"
	fi
}
pkg_postinst() {
	if use systemd ; then
	  systemd_reenable "${PN}.service"
	fi
	 elog "Even though the default /etc/lightdm/lightdm.conf will work for"
	elog "most users, make sure you configure it to suit your needs before"
	elog "using lightdm for the first time. You can test the configuration"
	elog "file with:"
	elog "  lightdm --test-mode -c /etc/lightdm/lightdm.conf"
	elog "This requires xorg-server to be built with the 'kdrive' USE flag."
	elog ""
	elog "You can set your own default values for LIGHTDM_GREETER,"
	elog "LIGHTDM_SESSION and LIGHTDM_USER in /etc/portage/make.conf"
	elog ""
	elog "Under OpenRC, lightdm is started by the shared xdm init script"
	elog "that ships with x11-base/xorg-server. Set:"
	elog "  DISPLAYMANAGER=\"lightdm\""
	elog "in /etc/conf.d/xdm, then enable it with:"
	elog "  rc-update add xdm default"
	 if use systemd ; then
	  elog ""
	  elog "Under systemd, enable the unit with:"
	  elog "  systemctl enable lightdm.service"
	fi
}



# vim: filetype=ebuild
