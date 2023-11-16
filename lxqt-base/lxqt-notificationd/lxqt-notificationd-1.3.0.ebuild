# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="LXQt notification daemon and library"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/lxqt-notificationd/tarball/83c2fb5c2f0d4a528d9e87d4c5000a14a6d13d0e -> lxqt-notificationd-1.3.0-83c2fb5.tar.gz"
KEYWORDS="*"

LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"

BDEPEND="
	dev-qt/linguist-tools:5
	dev-util/lxqt-build-tools
"
DEPEND="
	dev-libs/libqtxdg
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	kde-frameworks/kwindowsystem:5
	=lxqt-base/liblxqt-$(ver_cut 1-2)*
"
RDEPEND="${DEPEND}"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv "${WORKDIR}"/* "${S}" || die
	fi
}