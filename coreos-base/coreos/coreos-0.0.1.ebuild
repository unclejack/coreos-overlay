# Copyright (c) 2011 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=2

DESCRIPTION="CoreOS (meta package)"
HOMEPAGE="http://coreos.com"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""


################################################################################
#
# READ THIS BEFORE ADDING PACKAGES TO THIS EBUILD!
#
################################################################################
#
# Every chromeos dependency (along with its dependencies) is included in the
# release image -- more packages contribute to longer build times, a larger
# image, slower and bigger auto-updates, increased security risks, etc. Consider
# the following before adding a new package:
#
# 1. Does the package really need to be part of the release image?
#
# Some packages can be included only in the developer or test images, i.e., the
# chromeos-dev or chromeos-test ebuilds. If the package will eventually be used
# in the release but it's still under development, consider adding it to
# chromeos-dev initially until it's ready for production.
#
# 2. Why is the package a direct dependency of the chromeos ebuild?
#
# It makes sense for some packages to be included as a direct dependency of the
# chromeos ebuild but for most it doesn't. The package should be added as a
# direct dependency of the ebuilds for all packages that actually use it -- in
# time, this ensures correct builds and allows easier cleanup of obsolete
# packages. For example, if a utility will be invoked by the session manager,
# its package should be added as a dependency in the chromeos-login ebuild. Or
# if the package adds a daemon that will be started through an upstart job, it
# should be added as a dependency in the chromeos-init ebuild. If the package
# really needs to be a direct dependency of the chromeos ebuild, consider adding
# a comment why the package is needed and how it's used.
#
# 3. Are all default package features and dependent packages needed?
#
# The release image should include only packages and features that are needed in
# the production system. Often packages pull in features and additional packages
# that are never used. Review these and consider pruning them (e.g., through USE
# flags).
#
# 4. What is the impact on the image size?
#
# Before adding a package, evaluate the impact on the image size. If the package
# and its dependencies increase the image size significantly, consider
# alternative packages or approaches.
#
# 5. Is the package needed on all targets?
#
# If the package is needed only on some target boards, consider making it
# conditional through USE flags in the board overlays.
#
################################################################################

X86_DEPEND="
		sys-boot/syslinux
"

RDEPEND="${RDEPEND} x86? ( ${X86_DEPEND} )"
RDEPEND="${RDEPEND} amd64? ( ${X86_DEPEND} )"

RDEPEND="${RDEPEND}
	arm? (
		coreos-base/u-boot-scripts
	)
	"

RDEPEND="${RDEPEND}
	virtual/linux-sources
	"

RDEPEND="${RDEPEND} >=sys-apps/baselayout-2.0.0"

# Specifically include the editor we want to appear in chromeos images, so that
# it is deterministic which editor is chosen by 'virtual/editor' dependencies
# (such as in the 'sudo' package).  See crosbug.com/5777.
RDEPEND="${RDEPEND}
	app-editors/vim
	"

# TODO(ifup): 
#	coreos-base/crash-reporter
#	coreos-base/metrics

RDEPEND="${RDEPEND}
	sys-apps/findutils
	sys-apps/which
	app-admin/sudo
	app-admin/rsyslog
	app-arch/gzip
	app-arch/tar
	app-shells/bash
	coreos-base/chromeos-auth-config
	coreos-base/coreos-base
	coreos-base/cros_boot_mode
	coreos-base/vboot_reference
	coreos-base/update_engine
	coreos-base/coreos-installer
	coreos-base/coreos-init
	net-misc/dhcpcd
	net-firewall/iptables
	net-misc/rsync
	net-misc/tlsdate
	net-misc/wget
	sys-apps/coreutils
	sys-apps/dbus
	sys-apps/gawk
	sys-apps/grep
	sys-apps/less
	sys-apps/net-tools
	sys-apps/rootdev
	sys-apps/sed
	sys-apps/shadow
	sys-apps/systemd
	sys-apps/systemd-sysv-utils
	sys-apps/util-linux
	sys-auth/pam_pwdfile
	sys-fs/e2fsprogs
	sys-fs/aufs-util
	sys-libs/timezone-data
	sys-process/lsof
	sys-process/procps
	app-emulation/docker
	app-misc/ca-certificates
	app-crypt/gnupg
	virtual/udev
	dev-db/etcd
	dev-db/etcdctl
	net-fs/nfs-utils
	net-misc/iputils
	dev-vcs/git
	"
