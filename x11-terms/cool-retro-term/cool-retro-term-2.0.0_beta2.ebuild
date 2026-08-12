# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit qmake-utils xdg

DESCRIPTION="Terminal emulator which mimics the look and feel of the old cathode tube screens"
HOMEPAGE="https://github.com/Swordfish90/cool-retro-term"
SRC_URI="
https://api.github.com/repos/Swordfish90/cool-retro-term/tarball/2.0.0-beta2 -> cool-retro-term-2.0.0_beta2-1394ce8.tar.gz
mirror://macaroni/cool-retro-term-2.0.0_beta2-mark-gitsubmodules-bundle-1394ce8.tar.xz -> cool-retro-term-2.0.0_beta2-mark-gitsubmodules-bundle-1394ce8.tar.xz"
LICENSE="GPL-2 GPL-3 MIT"
SLOT="0"
KEYWORDS="*"
BDEPEND="dev-qt/qtshadertools:6
	
"
RDEPEND="dev-qt/qt5compat:6
	dev-qt/qtbase:6[gui,sql,sqlite]
	dev-qt/qtdeclarative:6
	
"
DEPEND="${RDEPEND}
"

post_src_unpack() {
	mv Swordfish90-cool-retro-term-* ${S}
}


# Qt6 qmake binary path
_get_qt6_qmake() {
	echo "${EPREFIX}/usr/$(get_libdir)/qt6/bin/qmake"
}
src_prepare() {
	xdg_src_prepare
	# The tarball has no git metadata, so stamp the version directly
	sed -e "s|^APP_VERSION = .*|APP_VERSION = 2.0.0-beta2|" \
	  -i app/app.pro || die
}
src_configure() {
	$(_get_qt6_qmake) \
	  -makefile \
	  QMAKE_AR="$(tc-getAR) cqs" \
	  QMAKE_CC="$(tc-getCC)" \
	  QMAKE_LINK_C="$(tc-getCC)" \
	  QMAKE_LINK_C_SHLIB="$(tc-getCC)" \
	  QMAKE_CXX="$(tc-getCXX)" \
	  QMAKE_LINK="$(tc-getCXX)" \
	  QMAKE_LINK_SHLIB="$(tc-getCXX)" \
	  QMAKE_OBJCOPY="$(tc-getOBJCOPY)" \
	  QMAKE_RANLIB= \
	  QMAKE_STRIP= \
	  QMAKE_CFLAGS="${CFLAGS}" \
	  QMAKE_CFLAGS_RELEASE= \
	  QMAKE_CFLAGS_DEBUG= \
	  QMAKE_CXXFLAGS="${CXXFLAGS}" \
	  QMAKE_CXXFLAGS_RELEASE= \
	  QMAKE_CXXFLAGS_DEBUG= \
	  QMAKE_LFLAGS="${LDFLAGS}" \
	  QMAKE_LFLAGS_RELEASE= \
	  QMAKE_LFLAGS_DEBUG= \
	  || die "qmake failed"
}
src_install() {
	# upstream install targets write straight into /usr without INSTALL_ROOT
	emake -j1 INSTALL_ROOT="${D}" install
	doman packaging/debian/cool-retro-term.1
	insinto /usr/share/metainfo
	doins packaging/appdata/cool-retro-term.appdata.xml
}



# vim: filetype=ebuild
