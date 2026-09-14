# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg

DESCRIPTION="A session manager for the Xfce desktop environment"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/xfce4-session/4.20/xfce4-session-4.20.4.tar.bz2 -> xfce4-session-4.20.4.tar.bz2"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="nls policykit wayland +xscreensaver X"
REQUIRED_USE="|| ( X wayland )"
BDEPEND="sys-devel/gettext
	virtual/pkgconfig
	
"
RDEPEND="x11-apps/xrdb
	nls? ( x11-misc/xdg-user-dirs )
	xscreensaver? ( xfce-extra/xfce4-screensaver )
	
"
DEPEND="dev-libs/glib
	x11-libs/gdk-pixbuf
	x11-libs/gtk+[X?,wayland?]
	xfce-base/libxfce4util
	xfce-base/libxfce4ui
	xfce-base/libxfce4windowing
	xfce-base/xfconf
	policykit? ( sys-auth/polkit )
	wayland? (
	        gui-libs/gtk-layer-shell
	)
	X? (
	        x11-apps/iceauth
	        x11-libs/libICE
	        x11-libs/libSM
	        x11-libs/libX11
	        x11-libs/libwnck
	)
	
"
src_configure() {
	      local myconf=(
	              $(use_enable X x11)
	              $(use_enable wayland)
	              $(use_enable policykit polkit)
	      )
	      econf "${myconf[@]}"
}
src_install() {
	      default
	      exeinto /etc/X11/Sessions
	      newexe - Xfce4 <<<startxfce4
	      dosym Xfce4 /etc/X11/Sessions/Xfce
}


# vim: filetype=ebuild
