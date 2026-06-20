# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg

DESCRIPTION="File manager for the Xfce desktop environment"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/thunar/4.20/thunar-4.20.8.tar.bz2 -> thunar-4.20.8.tar.bz2"
LICENSE="GPL-2+ LGPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="X exif gtk-doc introspection libnotify pcre policykit +trash-panel-plugin udisks"
BDEPEND="dev-util/xfce4-dev-tools
	dev-libs/glib
	dev-libs/libxml2
	sys-devel/gettext
	virtual/pkgconfig
	gtk-doc? ( dev-util/gtk-doc )
	
"
RDEPEND="dev-libs/glib
	x11-libs/gdk-pixbuf
	x11-libs/gtk+[X?]
	x11-libs/pango
	xfce-base/libxfce4ui
	xfce-base/libxfce4util
	xfce-base/xfconf
	exif? ( media-libs/gexiv2 )
	introspection? ( dev-libs/gobject-introspection )
	libnotify? ( x11-libs/libnotify )
	pcre? ( dev-libs/libpcre2 )
	trash-panel-plugin? ( xfce-base/xfce4-panel )
	udisks? ( dev-libs/libgudev )
	X? (
	        x11-libs/libICE
	        x11-libs/libSM
	        x11-libs/libX11
	)
	dev-util/desktop-file-utils
	x11-misc/shared-mime-info
	trash-panel-plugin? (
	        gnome-base/gvfs
	)
	udisks? (
	        gnome-base/gvfs[udisks,udev]
	        virtual/udev
	)
	
"
DEPEND="dev-libs/glib
	x11-libs/gdk-pixbuf
	x11-libs/gtk+[X?]
	x11-libs/pango
	xfce-base/libxfce4ui
	xfce-base/libxfce4util
	xfce-base/xfconf
	exif? ( media-libs/gexiv2 )
	introspection? ( dev-libs/gobject-introspection )
	libnotify? ( x11-libs/libnotify )
	pcre? ( dev-libs/libpcre2 )
	trash-panel-plugin? ( xfce-base/xfce4-panel )
	udisks? ( dev-libs/libgudev )
	X? (
	        x11-libs/libICE
	        x11-libs/libSM
	        x11-libs/libX11
	)
	policykit? ( sys-auth/polkit )
	
"
src_configure() {
	      local myconf=(
	              $(use_enable exif)
	              $(use_enable introspection)
	              $(use_enable libnotify notifications)
	              $(use_enable pcre pcre2)
	              $(use_enable udisks gudev)
	              $(use_enable trash-panel-plugin tpa-plugin)
	              $(use_with X x)
	      )
	      econf "${myconf[@]}"
}


# vim: filetype=ebuild
