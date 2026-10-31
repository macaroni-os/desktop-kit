# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake gnome3 python-single-r1 toolchain-funcs

DESCRIPTION="A personal and small business double entry accounting application"
HOMEPAGE="https://github.com/Gnucash/gnucash/"
SRC_URI="https://api.github.com/repos/Gnucash/gnucash/tarball/refs/tags/5.11 -> gnucash-5.11-5bedd7f.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
PATCHES=(
	"${FILESDIR}/gnucash-4.5-no-gui.patch"
	"${FILESDIR}/gnucash-3.8-examples-subdir.patch"
	"${FILESDIR}/gnucash-3.8-exclude-license.patch"
	"${FILESDIR}/gnucash-5.11-libxml2-2.14-remove-unused-sax-h.patch"
)
IUSE="aqbanking debug examples gnome-keyring +gui mysql nls ofx postgres python quotes -register2 smartcard +sqlite"
REQUIRED_USE="examples? ( gui )
python? ( ${PYTHON_REQUIRED_USE} )
smartcard? ( aqbanking )
"
BDEPEND="dev-lang/swig
	dev-util/cmake
	virtual/pkgconfig
	|| (
		sys-devel/gcc
		sys-devel/clang
	)
	
"
RDEPEND=">=dev-libs/glib-2.56.1:2
	>=dev-scheme/guile-2.2.0:=[regex]
	>=sys-libs/zlib-1.1.4
	dev-libs/boost:=[icu,nls]
	dev-libs/icu:=
	dev-libs/libxml2:2
	dev-libs/libxslt
	aqbanking? (
		>=net-libs/aqbanking-6[ofx?]
		sys-libs/gwenhywfar
		smartcard? ( sys-libs/libchipcard )
	)
	gnome-keyring? ( >=app-crypt/libsecret-0.18 )
	gui? (
		>=x11-libs/gtk+-3.22.30:3
		gnome-base/dconf
		net-libs/webkit-gtk:4=
		aqbanking? ( sys-libs/gwenhywfar[gtk] )
	)
	mysql? (
		dev-db/libdbi
		dev-db/libdbi-drivers[mysql]
	)
	ofx? ( >=dev-libs/libofx-0.9.1:= )
	postgres? (
		dev-db/libdbi
		dev-db/libdbi-drivers[postgres]
	)
	python? ( ${PYTHON_DEPS} )
	quotes? (
		>=dev-perl/Finance-Quote-1.11
		dev-perl/Date-Manip
		dev-perl/HTML-TableExtract
	)
	sqlite? (
		dev-db/libdbi
		dev-db/libdbi-drivers[sqlite]
	)
	
"
DEPEND="${RDEPEND}
	>=dev-cpp/gtest-1.8.0
	>=sys-devel/gettext-0.20
	dev-lang/perl
	dev-perl/XML-Parser
	sys-devel/libtool
	
"

post_src_unpack() {
	mv Gnucash-gnucash-* ${S}
}


src_prepare() {
	cmake_src_prepare
	 # The upstream code generate ChangeLog when code
	# is fetched through git and try to install it directly else.
	# Using github tarball without upstream
	# generation fails because the file is missed.
	# I generate an empty ChangeLog to avoid patching
	# the upstream code.
	touch "${S}/ChangeLog"
}
src_configure() {
	export GUILE_AUTO_COMPILE=0
	 local sql_on_off="OFF"
	if use mysql || use postgres || use sqlite ; then
	  sql_on_off="ON"
	fi
	 local mycmakeargs=(
	  -DCOMPILE_GSCHEMAS=OFF
	  -DDISABLE_NLS=$(usex !nls)
	  -DENABLE_REGISTER2=$(usex register2)
	  -DWITH_AQBANKING=$(usex aqbanking)
	  -DWITH_OFX=$(usex ofx)
	  -DWITH_PYTHON=$(usex python)
	  -DWITH_SQL=${sql_on_off}
	  -DWITH_GNUCASH=$(usex gui)
	)
	 cmake_src_configure
}
src_install() {
	cmake_src_install
	 # strip is unable to recognise the format of the input files (*.go)
	dostrip -x /usr/$(get_libdir)/guile
	 if use examples ; then
	  docompress -x /usr/share/doc/${PF}/examples
	else
	  rm -r "${ED}"/usr/share/doc/${PF}/examples
	fi
	 if use python ; then
	  python_optimize
	  python_optimize "${ED}"/usr/share/gnucash/python
	fi
	 # Drop empty ChangeLog
	rm -f "${ED}"/usr/share/doc/${PF}/ChangeLog
}
pkg_postinst() {
	gnome3_pkg_postinst
}



# vim: filetype=ebuild
