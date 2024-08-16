# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Data deduplication engine, supporting optional compression and public key encryption."
HOMEPAGE="https://github.com/dpc/rdedup"
SRC_URI="https://github.com/dpc/rdedup/tarball/12644270238087db087159bfc7e60df125fb5427 -> rdedup-3.2.1-1264427.tar.gz
https://distfiles.macaronios.org/74/19/87/7419878b9d1c190c5605b9982f4d97c107783f32605a7c52ae4cad3f7ea8833acd4f3d8cd2ebee10868e94018fcbc6a15bdc3bbf01c321c3bf7e1d5d5f3ca65d -> rdedup-3.2.1-funtoo-crates-bundle-cd2c6493512d400eab2d3b9025f07e8f0349979ca1bbb96c2bd61ca1995c04a37b8bb39d1e3aff5d96706a61752fb1926ff69df33500fb3c5986da420fd6a371.tar.gz"

LICENSE="Apache-2.0 BSD ISC MIT MPL-2.0 Unlicense"
SLOT="0"
KEYWORDS="*"

RDEPEND=">=dev-libs/libsodium-1.0.11:="
DEPEND="${RDEPEND}"
BDEPEND="virtual/rust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/dpc-rdedup-* ${S} || die
}

src_prepare() {
	default

	export LIBCLANG_PATH=$(dirname $(clang --print-file-name=libclang.so))
	# ln -sf "${WORKDIR}/cargo_home/gentoo/rdedup-lib-${PV}" lib || die
}

src_install() {
	cargo_src_install
	dodoc {CHANGELOG,README}.md
}