# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit bash-completion-r1 vala

DESCRIPTION="A configuration management system for Xfce"
HOMEPAGE="https://www.xfce.org"
SRC_URI="https://archive.xfce.org/src/xfce/xfconf/4.20/xfconf-4.20.0.tar.bz2 -> xfconf-4.20.0.tar.bz2"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="debug +introspection vala"
REQUIRED_USE="vala? ( introspection )"
BDEPEND="dev-util/gdbus-codegen
	dev-util/glib-utils
	sys-devel/gettext
	virtual/pkgconfig
	vala? ( $(vala_depend) )
	
"
DEPEND="dev-libs/glib
	sys-apps/dbus
	xfce-base/libxfce4util
	introspection? ( dev-libs/gobject-introspection )
	
"
src_prepare() {
	      default
}
src_configure() {
	      local myconf=(
	              $(use_enable introspection)
	              $(use_enable vala)
	              $(use_enable debug checks)
	              --with-bash-completion-dir="$(get_bashcompdir)"
	      )
	      use vala && vala_src_prepare
	      econf "${myconf[@]}"
}


# vim: filetype=ebuild
