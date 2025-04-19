# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit bash-completion-r1 cargo desktop python-any-r1

DESCRIPTION="A cross-platform, OpenGL terminal emulator."
HOMEPAGE="https://github.com/alacritty/alacritty"
SRC_URI="https://github.com/alacritty/alacritty/tarball/d8f4b75aad06f5dc3a46a397e2ed0f2464e13f18 -> alacritty-0.15.1-d8f4b75.tar.gz
https://distfiles.macaronios.org/4f/8f/76/4f8f768f0c14c06ff41671e8d9ab520f13d2cf92f5767d2a326edf21b4208d9df79d5be688fd020a655b163a02c89b95ec020c86852231c60d8c2fc8de08410d -> alacritty-0.15.1-funtoo-crates-bundle-e6b993082aef4290c4ea8f78e0d049a86e113eea39a2c38b8f183ae4d9757e5f819485bf23393768567839416337488cba8e6bca9a2ebf4e608a6522f27070f7.tar.gz"

KEYWORDS="*"
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions Boost-1.0 BSD BSD-2 CC0-1.0 FTL ISC MIT MPL-2.0 Unlicense WTFPL-2 ZLIB"
SLOT="0"
IUSE="wayland +X"

REQUIRED_USE="|| ( wayland X )"

DEPEND="${PYTHON_DEPS}"
BDEPEND="
	dev-util/cmake
	virtual/rust
"

COMMON_DEPEND="
	media-libs/fontconfig:=
	media-libs/freetype:2
	X? ( x11-libs/libxcb:=[xkb] )
"

RDEPEND="${COMMON_DEPEND}
	media-libs/mesa[X?,wayland?]
	sys-libs/zlib
	sys-libs/ncurses:0
	wayland? ( dev-libs/wayland )
	X? (
		x11-libs/libXcursor
		x11-libs/libXi
		x11-libs/libXrandr
	)
"

QA_FLAGS_IGNORED="usr/bin/alacritty"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/alacritty-alacritty-* ${S} || die
}

src_configure() {
	local myfeatures=(
		$(usex X x11 '')
		$(usev wayland)
	)
	cargo_src_configure --no-default-features
}

src_compile() {
	cd alacritty || die
	cargo_src_compile
}

src_install() {
	cargo_src_install --path alacritty

	newman extra/man/alacritty.1.scd alacritty.1
	newman extra/man/alacritty.5.scd alacritty.5

	newbashcomp extra/completions/alacritty.bash alacritty

	insinto /usr/share/fish/vendor_completions.d/
	doins extra/completions/alacritty.fish

	insinto /usr/share/zsh/site-functions
	doins extra/completions/_alacritty

	domenu extra/linux/Alacritty.desktop
	newicon extra/logo/compat/alacritty-term.svg Alacritty.svg

	insinto /usr/share/metainfo
	doins extra/linux/org.alacritty.Alacritty.appdata.xml

	insinto /usr/share/alacritty/scripts
	doins -r scripts/*

	local DOCS=(
		CHANGELOG.md INSTALL.md README.md
		docs/{escape_support.md,features.md}
	)
	einstalldocs
}

src_test() {
	cd alacritty || die
	cargo_src_test
}