# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
DISTUTILS_USE_PEP517="setuptools"
inherit distutils-r1

DESCRIPTION="A full-featured, hackable tiling window manager written in Python"
HOMEPAGE="http://www.qtile.org/"
SRC_URI="https://distfiles.macaronios.org/6e/8a/3d/6e8a3d2bd84e91d1c3f5e1349983eab577826e1b716126302d8bc9775f87b6c9cd625dee9a5ee895c4aa2d9f4369590da228a972e899a7328f1f307af6af4bd9 -> qtile-0.22.1.20230709.tar.gz"

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