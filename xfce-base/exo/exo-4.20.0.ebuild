# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg

DESCRIPTION="Extensions, widgets and framework library with session support for Xfce"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/exo/4.20/exo-4.20.0.tar.bz2 -> exo-4.20.0.tar.bz2"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
IUSE="wayland X"
BDEPEND="sys-devel/gettext
	virtual/pkgconfig
	
"
DEPEND="dev-libs/glib
	x11-libs/gtk+[wayland?,X?]
	xfce-base/libxfce4ui[gtk3(+)]
	xfce-base/libxfce4util
	
"
src_configure() {
	      default
}


# vim: filetype=ebuild
