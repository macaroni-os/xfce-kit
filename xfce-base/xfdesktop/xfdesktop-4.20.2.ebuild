# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg

DESCRIPTION="Desktop manager for the Xfce desktop environment"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/xfdesktop/4.20/xfdesktop-4.20.2.tar.bz2 -> xfdesktop-4.20.2.tar.bz2"
LICENSE="GPL-2+ CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="*"
IUSE="libnotify +thunar wayland X"
REQUIRED_USE="|| ( wayland X )"
BDEPEND="dev-libs/glib
	dev-util/gdbus-codegen
	dev-util/glib-utils
	sys-devel/gettext
	virtual/pkgconfig
	
"
DEPEND="x11-libs/cairo
	dev-libs/glib
	x11-libs/gtk+[wayland?,X?]
	xfce-base/exo
	xfce-base/garcon
	xfce-base/libxfce4ui[X(+)?]
	xfce-base/libxfce4util
	xfce-base/libxfce4windowing[X?]
	xfce-base/xfconf
	libnotify? ( x11-libs/libnotify )
	thunar? (
	        dev-libs/libyaml
	        xfce-base/thunar
	)
	wayland? ( gui-libs/gtk-layer-shell )
	X? ( x11-libs/libX11 )
	
"
src_configure() {
	      local myconf=(
	              $(use_enable wayland)
	              $(use_enable X x11)
	              $(use_enable thunar file-icons)
	              $(use_enable thunar thunarx)
	              $(use_enable libnotify notifications)
	              --disable-tests
	      )
	      econf "${myconf[@]}"
}


# vim: filetype=ebuild
