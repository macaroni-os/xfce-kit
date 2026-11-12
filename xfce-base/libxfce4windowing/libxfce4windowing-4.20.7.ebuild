# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson vala

DESCRIPTION="Unified widget and session management libs for Xfce"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/libxfce4windowing/4.20/libxfce4windowing-4.20.7.tar.bz2 -> libxfce4windowing-4.20.7.tar.bz2"
LICENSE="LGPL-2.1+"
SLOT="0/4.19.6"
KEYWORDS="*"
IUSE="+introspection wayland X vala"
REQUIRED_USE="|| ( wayland X )
vala? ( introspection )"
BDEPEND="dev-util/xfce4-dev-tools
	dev-lang/perl
	sys-devel/gettext
	virtual/pkgconfig
	vala? ( $(vala_depend) )
	wayland? (
	        dev-util/wayland-scanner
	)
	
"
DEPEND="dev-libs/glib
	x11-libs/gtk+[X?,introspection?,wayland?]
	x11-libs/gdk-pixbuf[introspection?]
	wayland? (
	        dev-libs/wayland
	)
	X? (
	        media-libs/libdisplay-info
	        x11-libs/libX11
	        x11-libs/libXrandr
	        x11-libs/libwnck
	)
	
"
src_prepare() {
				default
				use vala && vala_src_prepare
}
src_configure() {
				local emesonargs=(
								$(meson_use introspection)
								$(meson_feature vala)
								$(meson_feature wayland)
								$(meson_feature X x11)
								-Dtests=false
				)
				meson_src_configure
}


# vim: filetype=ebuild
