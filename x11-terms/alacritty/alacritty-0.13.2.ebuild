# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit bash-completion-r1 cargo desktop python-any-r1

DESCRIPTION="A cross-platform, OpenGL terminal emulator."
HOMEPAGE="https://github.com/alacritty/alacritty"
SRC_URI="https://github.com/alacritty/alacritty/tarball/247b3564633afb2fcd6efbc88875f263c5623fca -> alacritty-0.13.2-247b356.tar.gz
https://distfiles.macaronios.org/df/37/b0/df37b010012609b17dcdb9fce5af3231dab905673f50ecbf2443df3dc7e98e5954706b73aa84638c8c34e45859d69277ff00dfd75fd2678d3efccd9e31fd6d40 -> alacritty-0.13.2-funtoo-crates-bundle-455e50e0a7565f7d47840d84f98c98c6c6c911f0388fc09f061af1a3b2db48f885742eac8d6edc8533cfbb1ac6ad077178f0660a61c0fad3584fffb6c4f7c75c.tar.gz"

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