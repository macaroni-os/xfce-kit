# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg

DESCRIPTION="A tool to find and launch installed applications for the Xfce desktop"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/xfce4-appfinder/4.20/xfce4-appfinder-4.20.0.tar.bz2 -> xfce4-appfinder-4.20.0.tar.bz2"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
BDEPEND="sys-devel/gettext
	virtual/pkgconfig
	
"
DEPEND="dev-libs/glib
	x11-libs/gtk+
	xfce-base/garcon
	xfce-base/libxfce4util
	xfce-base/libxfce4ui[gtk3(+)]
	xfce-base/xfconf
	
"

# vim: filetype=ebuild
