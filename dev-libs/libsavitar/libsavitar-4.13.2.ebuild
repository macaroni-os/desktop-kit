# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit cmake python-single-r1

DESCRIPTION="C++ implementation of 3mf loading with SIP python bindings"
HOMEPAGE="https://github.com/Ultimaker/libSavitar"
SRC_URI="https://github.com/Ultimaker/libSavitar/tarball/68a8868e0b30883b461c0dde77f6e85ce0a4d2ef -> libSavitar-4.13.2-68a8868.tar.gz"

LICENSE="LGPL-3"
SLOT="0/3"
KEYWORDS="*"

IUSE="+python static-libs test"
RESTRICT="!test? ( test )"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="${PYTHON_DEPS}
	dev-libs/pugixml
	$(python_gen_cond_dep '
		<dev-python/sip-5[${PYTHON_USEDEP}]
	')"

DEPEND="${RDEPEND}
	test? (
		dev-cpp/gtest
		dev-cpp/tbb
	)"

BUILD_DIR="${S}/build"

PATCHES=( "${FILESDIR}/${PN}-4.7.0-use-system-pugixml.patch" )

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv Ultimaker-libSavitar* "${S}" || die
	fi
}

src_prepare() {
	# remove bundled pugixml
	rm -r "${S}"/pugixml || die

	find "${S}"/src -type f -name '*.cpp' -o -name '*.h' | xargs sed -i \
		-e 's "../pugixml/src/pugixml.hpp" <pugixml.hpp> g' || die

	if use test; then
		find "${S}"/tests -type f -name '*.cpp' -o -name '*.h' | xargs sed -i \
			-e 's "../pugixml/src/pugixml.hpp" <pugixml.hpp> g' || die
	fi

	# find SIP for current python version, not the latest installed
	sed -i -e "s/find_package(Python3 3.4 REQUIRED/find_package(Python3 ${EPYTHON##python} EXACT REQUIRED/g" \
		CMakeLists.txt cmake/FindSIP.cmake || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_PYTHON=$(usex python ON OFF)
		-DBUILD_STATIC=$(usex static-libs ON OFF)
		-DBUILD_TESTS=$(usex test ON OFF)
	)

	cmake_src_configure
}

src_test() {
	cmake_src_test
}