# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PLOCALES="ar bn ca cs da de es et eu fi fr he hi_IN hu ie is it ja kk ko lt lv nb nl nn oc pl pt_BR pt_PT ro ru sk sr sr@ijekavian sr@ijekavianlatin sr@latin sv tr uk zh_CN zh_TW"
inherit cmake-utils l10n systemd user

DESCRIPTION="QML based X11 and Wayland display manager"
HOMEPAGE="https://github.com/sddm/sddm"
SRC_URI="https://api.github.com/repos/sddm/sddm/tarball/v0.21.0 -> sddm-0.21.0-63780fc.tar.gz"
LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="*"
PATCHES=(
	"${FILESDIR}/sddm-0.20.0-respect-user-flags.patch"
	"${FILESDIR}/sddm-0.21.0_p20251101-fix-restart-greeter.patch"
	"${FILESDIR}/sddm-0.21.0_p20250310-set-XAUTHLOCALHOSTNAME.patch"
	"${FILESDIR}/sddm-0.21.0_p20251101-fix-terminal-clearing.patch"
)
IUSE="elogind +pam systemd qt5"
REQUIRED_USE="?? ( elogind systemd )
"
# Commons depends
CDEPEND="qt5? (
	  dev-qt/qtcore:5
	  dev-qt/qtdbus:5
	  dev-qt/qtdeclarative:5
	  dev-qt/qtgui:5
	  dev-qt/qtnetwork:5
	)
	!qt5? (
	  dev-qt/qtbase:6[gui]
	  dev-qt/qtdeclarative:6
	)
	sys-libs/pam
	x11-libs/libXau
	x11-libs/libxcb:=
	elogind? (
	  sys-auth/elogind
	)
	pam? ( sys-libs/pam )
	systemd? ( sys-apps/systemd:= )
	!systemd? ( sys-power/upower )
	
"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="${CDEPEND}
	x11-misc/xcb
	
"
DEPEND="${CDEPEND}
	dev-python/docutils
	kde-frameworks/extra-cmake-modules
	qt5? (
	  dev-qt/linguist-tools:5
	)
	
"

post_src_unpack() {
	mv sddm-sddm-* ${S}
}


src_prepare() {
	cmake-utils_src_prepare
	disable_locale() {
	  sed -e "/${1}\.ts/d" -i data/translations/CMakeLists.txt || die
	}
	l10n_find_plocales_changes "data/translations" "" ".ts"
	l10n_for_each_disabled_locale_do disable_locale
	sed -e "/^find_package/s/ Test//" -i CMakeLists.txt || die
	cmake_comment_add_subdirectory test
}
src_configure() {
	local mycmakeargs=(
	  -DENABLE_PAM=$(usex pam)
	  -DNO_SYSTEMD=$(usex '!systemd')
	  -DUSE_ELOGIND=$(usex 'elogind')
	  -DBUILD_MAN_PAGES=ON
	  -DDBUS_CONFIG_FILENAME="org.freedesktop.sddm.conf"
	)
	if ! use qt5 ; then
	  mycmakeargs+=(
	    -DBUILD_WITH_QT6=ON
	  )
	fi
	cmake-utils_src_configure
}
src_install() {
	cmake-utils_src_install
	if ! use systemd; then
	  insinto /etc/logrotate.d
	  newins "${FILESDIR}/sddm.logrotate" sddm
	fi
	# Create a default.conf as upstream dropped /etc/sddm.conf w/o replacement
	local confd="/usr/share/sddm/sddm.conf.d"
	dodir ${confd}
	"${D}"/usr/bin/sddm --example-config > "${D}/${confd}"/00default.conf \
	  || die "Failed to create 00default.conf"
	sed -e "/^InputMethod/s/qtvirtualkeyboard//" \
	  -i "${D}/${confd}"/00default.conf || die
	if ! use elogind && ! use systemd ; then
	  # When both elogind and systemd are disable the configure.ac
	  # generates the file /etc/pam.d/sddm-greeter with pam_systemd.so
	  # intergration. This generates errors on logs.
	  sed -i -e '/pam_systemd.so/d' "${D}"/etc/pam.d/sddm-greeter
	fi
}
pkg_postinst() {
	elog "Starting with 0.18.0, SDDM no longer installs /etc/sddm.conf"
	elog "Use it to override specific options. SDDM defaults are now"
	elog "found in: /usr/share/sddm/sddm.conf.d/00default.conf"
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /var/lib/${PN} ${PN},video
	if use systemd ; then
	  systemd_reenable sddm.service
	fi
}



# vim: filetype=ebuild
