# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop optfeature prefix xdg

DESCRIPTION="Screenshot tool for Linux"
HOMEPAGE="https://github.com/shutter-project/shutter"
SRC_URI="https://github.com/shutter-project/shutter/tarball/fa324ef66fbeb66dd228317ebd1d015e50c4fb5d -> shutter-0.99.5-fa324ef.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	dev-lang/perl
	dev-perl/Carp-Always
	dev-perl/libxml-perl
	dev-perl/libwww-perl
	dev-perl/Glib-Object-Introspection
	dev-perl/GooCanvas2
	dev-perl/GooCanvas2-CairoTypes
	dev-perl/Gtk3
	>=dev-perl/Gtk3-ImageView-10
	dev-perl/File-DesktopEntry
	dev-perl/File-HomeDir
	dev-perl/File-Which
	dev-perl/JSON
	dev-perl/File-Copy-Recursive
	dev-perl/File-MimeInfo
	dev-perl/Locale-gettext
	dev-perl/Moo
	dev-perl/Net-DBus
	dev-perl/Number-Bytes-Human
	dev-perl/Pango
	dev-perl/Proc-Simple
	dev-perl/Proc-ProcessTable
	dev-perl/Sort-Naturally
	dev-perl/WWW-Mechanize
	dev-perl/X11-Protocol
	dev-perl/XML-Simple
	media-gfx/imagemagick[perl]
	x11-libs/libwnck:3[introspection]
"
BDEPEND="sys-devel/gettext"

post_src_unpack() {
	mv "${WORKDIR}"/shutter-project-shutter* "${S}" || die
}

src_prepare() {
	hprefixify bin/shutter
	default
}

src_install() {
	dobin bin/shutter
	dodoc README
	domenu share/applications/shutter.desktop
	doicon share/pixmaps/shutter.png
	doman share/man/man1/shutter.1

	insinto /usr/share
	doins -r share/shutter
	doins -r share/locale
	doins -r share/icons

	insinto /usr/share/metainfo
	doins share/metainfo/shutter.metainfo.xml

	# .po doesn't belong to installed system, only .mo
	rm -r "${ED}"/usr/share/shutter/resources/po || die

	# shutter executes perl scripts as standalone scripts, and after that "require"s them.
	find "${ED}"/usr/share/shutter/resources/system/plugins/ -type f ! -name '*.*' -exec chmod +x {} + \
		|| die "failed to make plugins executables"
	find "${ED}"/usr/share/shutter/resources/system/upload_plugins/upload -type f \
		-name "*.pm" -exec chmod +x {} + || die "failed to make upload plugins executables"
}

pkg_postinst() {
	xdg_pkg_postinst

	optfeature "writing Exif information" media-libs/exiftool
	optfeature "image hostings uploading" "dev-perl/JSON-MaybeXS dev-perl/Net-OAuth dev-perl/Path-Class"
}