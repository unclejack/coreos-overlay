# Copyright (c) 2009 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=2

DESCRIPTION="List of packages that are needed on the buildhost (meta package)"
HOMEPAGE="http://src.chromium.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# Needed to run setup crossdev, run build scripts, and make a bootable image.
RDEPEND="${RDEPEND}
	app-arch/lzop
	app-arch/pigz
	app-admin/sudo
	sys-apps/less
	dev-embedded/u-boot-tools
	dev-util/ccache
	dev-util/crosutils
	>=sys-apps/dtc-1.3.0-r5
	sys-boot/syslinux
	sys-devel/crossdev
	sys-devel/sysroot-wrappers
	sys-fs/dosfstools
	"

# Host dependencies for building cross-compiled packages.
# TODO: chromeos-base/chromeos-installer
RDEPEND="${RDEPEND}
	app-arch/cabextract
	>=app-arch/pbzip2-1.1.1-r1
	app-arch/rpm2targz
	app-arch/sharutils
	app-arch/unzip
	dev-libs/nss
	app-emulation/qemu
	app-text/texi2html
	coreos-base/google-breakpad
	coreos-base/coreos-base
	coreos-base/coreos-installer
	coreos-base/cros-devutils[cros_host]
	coreos-base/cros-factoryutils
	coreos-base/cros-testutils
	=dev-lang/python-2*
	dev-python/setuptools
	dev-lang/nasm
	dev-lang/swig
	dev-lang/yasm
	dev-lang/go
	dev-libs/dbus-c++
	dev-libs/dbus-glib
	>=dev-libs/glib-2.26.1
	dev-libs/libgcrypt
	dev-libs/libxslt
	dev-libs/libyaml
	dev-libs/protobuf
	dev-python/cherrypy
	dev-python/ctypesgen
	dev-python/dbus-python
	dev-python/imaging
	dev-python/m2crypto
	dev-python/mako
	dev-python/netifaces
	dev-python/pygobject
	dev-python/pyinotify
	dev-python/pyopenssl
	dev-python/python-daemon
	dev-python/pyudev
	dev-python/pyusb
	dev-python/setproctitle
	dev-python/ws4py
	sys-devel/bc
	dev-util/cmake
	dev-util/gob
	dev-util/gdbus-codegen
	dev-util/gperf
	dev-util/gtk-doc
	>=dev-util/gtk-doc-am-1.13
	>=dev-util/intltool-0.30
	dev-util/scons
	dev-vcs/cvs
	>=dev-vcs/git-1.7.2
	dev-vcs/mercurial
	dev-vcs/subversion[-dso]
	>=media-libs/freetype-2.2.1
	net-misc/gsutil
	sys-apps/usbutils
	!sys-apps/nih-dbus-tool
	=sys-devel/automake-1.10*
	sys-fs/sshfs-fuse
	sys-libs/libnih
	sys-power/iasl
	virtual/udev
	dev-libs/protobuf-c
	app-text/asciidoc
	app-text/xmlto
	sys-apps/gptfdisk
	net-libs/libtirpc
	"

# Host dependencies that create usernames/groups we need to pull over to target.
RDEPEND="${RDEPEND}
	sys-apps/dbus
	"

# Host dependencies that are needed by mod_image_for_test.
RDEPEND="${RDEPEND}
	sys-process/lsof
	"

# Useful utilities for developers.
RDEPEND="${RDEPEND}
	app-arch/zip
	app-portage/eclass-manpages
	app-portage/gentoolkit
	app-portage/portage-utils
	app-editors/qemacs
	app-editors/vim
	dev-util/perf
	sys-apps/pv
	app-shells/bash-completion
	sys-devel/smatch
	"

# Host dependencies that are needed for autotests.
RDEPEND="${RDEPEND}
	dev-util/dejagnu
	"

# Host dependencies that are needed to create and sign images
# TODO:	sys-apps/mosys
RDEPEND="${RDEPEND}
	coreos-base/verity
	sys-fs/libfat
	sys-fs/squashfs-tools
	"

# Host dependency used by the chromeos-base/root-certificates ebuild
RDEPEND="${RDEPEND}
	>=app-misc/ca-certificates-20090709-r6
	"

# Host dependencies that are needed for delta_generator.
RDEPEND="${RDEPEND}
	coreos-base/update_engine
	"

# Needed for uploading to the update.core-os.net servers
RDEPEND="${RDEPEND}
	coreos-base/core-admin
	"

# Host dependencies to run unit tests within the chroot
RDEPEND="${RDEPEND}
	dev-cpp/gflags
	dev-python/mock
	dev-python/mox
	dev-python/unittest2
	"

# Host dependencies for running pylint within the chroot
RDEPEND="${RDEPEND}
	dev-python/pylint
	"

# Host dependencies to scp binaries from the binary component server
# TODO: chromeos-base/ssh-known-hosts
#	chromeos-base/ssh-root-dot-dir
RDEPEND="${RDEPEND}
	net-misc/openssh
	net-misc/wget
	"

# Host dependencies that are needed for chromite/bin/upload_package_status
RDEPEND="${RDEPEND}
	dev-python/gdata
	"

# Host dependencies for taking to dev boards
RDEPEND="${RDEPEND}
	dev-embedded/smdk-dltool
	"

# Host dependencies for HWID processing
RDEPEND="${RDEPEND}
	dev-python/pyyaml
	"

# Tools for working with compiler generated profile information
# (such as coverage analysis in common.mk)
RDEPEND="${RDEPEND}
	dev-util/lcov
	"

# Uninstall these packages.
RDEPEND="${RDEPEND}
	!net-misc/dhcpcd
	"
