# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg vala

DESCRIPTION="Unified widget and session management libs for Xfce"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/libxfce4ui/4.20/libxfce4ui-4.20.2.tar.bz2 -> libxfce4ui-4.20.2.tar.bz2"
LICENSE="LGPL-2+ GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="glade +introspection startup-notification system-info vala wayland X"
REQUIRED_USE="|| ( wayland X ) vala? ( introspection )"
BDEPEND="dev-lang/perl
	sys-devel/gettext
	virtual/pkgconfig
	vala? ( $(vala_depend) )
	
"
DEPEND="dev-libs/glib
	x11-libs/gtk+[introspection?,wayland?,X?]
	xfce-base/libxfce4util[introspection?,vala?]
	xfce-base/xfconf
	glade? ( dev-util/glade )
	introspection? ( dev-libs/gobject-introspection )
	system-info? (
	        dev-libs/libgudev
	        gnome-base/libgtop
	        media-libs/libepoxy
	)
	X? (
	        x11-libs/libICE
	        x11-libs/libSM
	        x11-libs/libX11
	        startup-notification? ( x11-libs/startup-notification )
	)
	x11-base/xorg-proto
	
"
src_prepare() {
	      default
}
src_configure() {
	      local myconf=(
	              $(use_enable glade gladeui2)
	              $(use_enable introspection)
	              $(use_enable system-info glibtop)
	              $(use_enable wayland)
	              $(use_enable X x11)
	              $(use_enable startup-notification)
	      )
	      use vala && vala_src_prepare
	      econf "${myconf[@]}"
}


# vim: filetype=ebuild
