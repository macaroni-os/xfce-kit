# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson vala

DESCRIPTION="A basic utility library for the Xfce desktop environment"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/libxfce4util/4.20/libxfce4util-4.20.1.tar.bz2 -> libxfce4util-4.20.1.tar.bz2"
LICENSE="LGPL-2+ GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="+introspection vala"
REQUIRED_USE="vala? ( introspection )"
BDEPEND="sys-devel/gettext
	virtual/pkgconfig
	vala? ( $(vala_depend) )
	
"
DEPEND="dev-libs/glib
	introspection? ( dev-libs/gobject-introspection )
	
"
src_prepare() {
	      default
	      vala_src_prepare
}
src_configure() {
	      local emesonargs=(
	              $(meson_use introspection)
	              $(meson_feature vala)
	              -Dgtk-doc=false
	      )
	      meson_src_configure
}


# vim: filetype=ebuild
