# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit desktop eutils pax-utils xdg

DESCRIPTION="Supercharge your API workflow"
HOMEPAGE="https://www.postman.com"
SRC_URI="https://dl.pstmn.io/download/version/11.73.5/linux64 -> postman-bin-11.73.5-linux64.tar.gz"
LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="pax_kernel"
RESTRICT="strip"
RDEPEND="app-crypt/libsecret
	
"
S=""${WORKDIR}/Postman/app""
src_install() {
	local dir="/opt/${PN}"
	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}"/postman
	fperms 755 "${dir}"/Postman
	 fperms 4755 "${dir}"/chrome-sandbox || die
	if [ -f "${ED%/}${dir}"/chrome_crashpad_handler ]; then
	  fperms 4755 "${dir}"/chrome_crashpad_handler || die
	fi
	 make_wrapper "${PN}" "${dir}/Postman"
	newicon "resources/app/assets/icon.png" "${PN}.png"
	make_desktop_entry "${PN}" "Postman" "${PN}" "Development;IDE;"
	 use pax_kernel && pax-mark m "${ED}/opt/postman/Postman"
}


# vim: filetype=ebuild
