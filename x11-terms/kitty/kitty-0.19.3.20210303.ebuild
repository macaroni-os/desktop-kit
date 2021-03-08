# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit python-single-r1 toolchain-funcs xdg

SRC_URI="https://github.com/kovidgoyal/kitty/archive/1ded78a98c87f953df2c49089265eaba50865da9.tar.gz"
KEYWORDS="*"

DESCRIPTION="A modern, hackable, featureful, OpenGL-based terminal emulator"
HOMEPAGE="https://github.com/kovidgoyal/kitty"

LICENSE="GPL-3"
SLOT="0"
IUSE="debug wayland"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	x11-terms/kitty-terminfo
	media-libs/fontconfig
	media-libs/freetype:2
	>=media-libs/harfbuzz-1.5.0:=
	media-libs/lcms
	media-libs/libcanberra
	media-libs/libpng:0=
	sys-apps/dbus
	sys-libs/zlib
	x11-libs/libxcb[xkb]
	x11-libs/libXcursor
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libxkbcommon[X]
	x11-libs/libXrandr
	wayland? (
		dev-libs/wayland
		>=dev-libs/wayland-protocols-1.17
	)
	$(python_gen_cond_dep 'dev-python/importlib_resources[${PYTHON_USEDEP}]' python3_6)
"

DEPEND="${RDEPEND}
	media-libs/mesa[X]
	sys-libs/ncurses
"

BDEPEND="
	virtual/pkgconfig
	>=dev-python/sphinx-1.7
"

PATCHES=(
		${REPODIR}/x11-terms/kitty-gen/files/kitty-0.14.4-svg-icon.patch
		${REPODIR}/x11-terms/kitty-gen/files/kitty-0.19.3.20210303-flags.patch
)

src_unpack() {
	unpack ${A}
	rm -rf ${S}
	mv ${WORKDIR}/kitty-* ${S} || die
}

src_prepare() {
	default

	sed -i -e "/build_terminfo =/,+4d" setup.py # remove terminfo
	sed -i "s/'launcher'/'..\/linux-package\/bin'/" kitty/constants.py # tests

	# disable wayland as required
	if ! use wayland; then
		sed -i "/'x11 wayland'/s/ wayland//" setup.py || die
	fi

	# respect doc dir
	sed -i "/htmldir =/s/appname/'${PF}'/" setup.py || die

	tc-export CC
}

src_compile() {
	"${EPYTHON}" setup.py \
		--verbose $(usex debug --debug "") \
		--libdir-name $(get_libdir) \
		linux-package || die "Failed to compile kitty."
}

src_test() {
	export KITTY_CONFIG_DIRECTORY=${T}
	"${EPYTHON}" test.py || die
}

src_install() {
	insinto /usr
	doins -r linux-package/*
	dobin linux-package/bin/kitty
	python_fix_shebang "${ED}"
}

pkg_postinst() {
	xdg_icon_cache_update
	elog "Displaying images in the terminal" virtual/imagemagick-tools
}

pkg_postrm() {
	xdg_icon_cache_update
}