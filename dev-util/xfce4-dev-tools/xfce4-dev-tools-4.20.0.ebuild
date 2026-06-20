# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7

DESCRIPTION="A set of scripts and m4/autoconf macros that ease build system maintenance"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/xfce4-dev-tools/4.20/xfce4-dev-tools-4.20.0.tar.bz2 -> xfce4-dev-tools-4.20.0.tar.bz2"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
BDEPEND="dev-util/meson
	dev-libs/libxslt
	virtual/pkgconfig
	
"
RDEPEND="dev-util/meson
	
"
DEPEND="dev-libs/glib
	
"

# vim: filetype=ebuild
