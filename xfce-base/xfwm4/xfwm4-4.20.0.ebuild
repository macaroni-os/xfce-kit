# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg

DESCRIPTION="Window manager for the Xfce desktop environment"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/xfwm4/4.20/xfwm4-4.20.0.tar.bz2 -> xfwm4-4.20.0.tar.bz2"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="opengl startup-notification +xcomposite +xpresent"
BDEPEND="dev-libs/glib
	sys-devel/gettext
	virtual/pkgconfig
	
"
DEPEND="dev-libs/glib
	x11-libs/gtk+
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXres
	x11-libs/pango
	x11-libs/libwnck
	xfce-base/libxfce4util
	xfce-base/libxfce4ui
	xfce-base/xfconf
	opengl? ( media-libs/libepoxy[X(+)] )
	startup-notification? ( x11-libs/startup-notification )
	xcomposite? (
	        x11-libs/libXcomposite
	        x11-libs/libXdamage
	        x11-libs/libXfixes
	)
	xpresent? ( x11-libs/libXpresent )
	
"
src_configure() {
	      local myconf=(
	              $(use_enable opengl epoxy)
	              $(use_enable startup-notification)
	              $(use_enable xcomposite compositor)
	              $(use_enable xpresent)
	              --enable-randr
	              --enable-render
	              --enable-xi2
	              --enable-xsync
	      )
	      econf "${myconf[@]}"
}


# vim: filetype=ebuild
