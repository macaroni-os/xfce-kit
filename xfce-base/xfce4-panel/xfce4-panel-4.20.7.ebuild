# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg

DESCRIPTION="Panel for the Xfce desktop environment"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/xfce4-panel/4.20/xfce4-panel-4.20.7.tar.bz2 -> xfce4-panel-4.20.7.tar.bz2"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
IUSE="dbusmenu introspection wayland X"
REQUIRED_USE="|| ( wayland X )"
BDEPEND="dev-util/gdbus-codegen
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig
	
"
DEPEND="dev-libs/glib
	x11-libs/cairo
	x11-libs/gtk+[X?,introspection?,wayland?]
	xfce-base/exo
	xfce-base/garcon
	xfce-base/libxfce4ui
	xfce-base/libxfce4util[introspection?]
	xfce-base/libxfce4windowing[X?]
	xfce-base/xfconf
	dbusmenu? ( dev-libs/libdbusmenu[gtk3] )
	introspection? ( dev-libs/gobject-introspection )
	wayland? (
	        dev-libs/wayland
	        gui-libs/gtk-layer-shell
	)
	X? (
	        x11-libs/libX11
	        x11-libs/libXext
	        x11-libs/libwnck
	)
	
"
src_configure() {
	      local myconf=(
	              $(use_enable introspection)
	              $(use_enable wayland)
	              $(use_enable X x11)
	              $(use_enable dbusmenu dbusmenu-gtk3)
	      )
	      econf "${myconf[@]}"
}


# vim: filetype=ebuild
