# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
DISTUTILS_USE_PEP517="setuptools"
inherit distutils-r1

DESCRIPTION="A full-featured, hackable tiling window manager written in Python"
HOMEPAGE="http://www.qtile.org/"
SRC_URI="https://distfiles.macaronios.org/10/cf/49/10cf49f8aeb02b22058b70b1794f979afff8ef0ed8765ab4dca646b5b549461ff72d3690ea4b2361978bf326ff2e2cd5a033b8dece2d38d8f29490763b8a57c8 -> qtile-0.22.1.20230709.tar.gz"

DEPEND=""
RDEPEND="
	x11-libs/cairo[X,xcb(+)]
	x11-libs/pango
	x11-libs/libnotify
	media-sound/pulseaudio
	dev-python/setuptools_scm[${PYTHON_USEDEP}]
	>=dev-python/cairocffi-1.6.0-r1[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/xcffib-0.8.1[${PYTHON_USEDEP}]
	dev-python/dbus-next[${PYTHON_USEDEP}]"

IUSE=""
RESTRICT="test"
SLOT="0"
LICENSE="MIT"
KEYWORDS="*"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv "${WORKDIR}"/funtoo-qtile* "$S" || die
	fi
}

python_install_all() {
	local DOCS=( CHANGELOG README.rst )
	distutils-r1_python_install_all
	insinto /usr/share/xsessions
	doins resources/qtile.desktop
	exeinto /etc/X11/Sessions
	newexe "${FILESDIR}"/${PN}-session ${PN}
}