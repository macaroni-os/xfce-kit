# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg

DESCRIPTION="Xfce's freedesktop.org specification compatible menu implementation library"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/garcon/4.20/garcon-4.20.0.tar.bz2 -> garcon-4.20.0.tar.bz2"
LICENSE="LGPL-2+ FDL-1.1+"
SLOT="0"
KEYWORDS="*"
IUSE="introspection"
BDEPEND="dev-util/glib-utils
	sys-devel/gettext
	virtual/pkgconfig
	introspection? ( dev-libs/gobject-introspection )
	
"
DEPEND="dev-libs/glib
	x11-libs/gtk+
	xfce-base/libxfce4util[introspection?]
	xfce-base/libxfce4ui[introspection?]
	introspection? ( dev-libs/gobject-introspection )
	
"
src_configure() {
	      local myconf=(
	              $(use_enable introspection)
	      )
	      econf "${myconf[@]}"
}


# vim: filetype=ebuild
