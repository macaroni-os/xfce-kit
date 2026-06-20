# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg

DESCRIPTION="Configuration system for the Xfce desktop environment"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/xfce4-settings/4.20/xfce4-settings-4.20.4.tar.bz2 -> xfce4-settings-4.20.4.tar.bz2"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="X colord input_devices_libinput libnotify upower wayland +xklavier"
REQUIRED_USE="|| ( X wayland )"
BDEPEND="dev-libs/libxml2
	dev-util/gdbus-codegen
	sys-devel/gettext
	virtual/pkgconfig
	
"
DEPEND="dev-libs/glib
	x11-libs/gtk+[X?,wayland?]
	xfce-base/garcon
	xfce-base/libxfce4ui[X?]
	xfce-base/libxfce4util
	xfce-base/xfconf
	colord? ( x11-misc/colord )
	upower? ( sys-power/upower )
	X? (
	        media-libs/fontconfig
	        x11-libs/libX11
	        x11-libs/libXcursor
	        x11-libs/libXext
	        x11-libs/libXi
	        x11-libs/libXrandr
	        input_devices_libinput? ( x11-drivers/xf86-input-libinput )
	        libnotify? ( x11-libs/libnotify )
	        xklavier? ( x11-libs/libxklavier )
	        x11-base/xorg-proto
	)
	wayland? (
	        dev-libs/wayland
	        gui-libs/gtk-layer-shell
	)
	
"
src_configure() {
	      local myconf=(
	              $(use_enable X x11)
	              $(use_enable wayland)
	              $(use_enable libnotify)
	              $(use_enable xklavier libxklavier)
	              $(use_enable upower upower-glib)
	              $(use_enable colord)
	              $(use_enable input_devices_libinput xorg-libinput)
	      )
	      econf "${myconf[@]}"
}


# vim: filetype=ebuild
