# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/gentoo-sources/gentoo-sources-2.6.31.ebuild,v 1.1 2009/09/10 01:18:59 mpagano Exp $

ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="16"
K_DEBLOB_AVAILABLE="0"
K_SECURITY_UNSUPPORTED="1"
CKV="${PV/_p[0-9]*}"
inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE=""
HOMEPAGE="http://ck-hack.blogspot.com"
#RESTRICT="primaryuri"

DESCRIPTION="Full Gentoo sources including the Brainfuck Scheduler for the ${KV_MAJOR}.${KV_MINOR} kernel tree"

BFS_VER="${PV##*_p}"
TARGET_KV="${KV_MAJOR}.${KV_MINOR}.${KV_PATCH}"
BFS_SOURCE="${TARGET_KV}.11-sched-bfs-${BFS_VER}"
BFS_URI="http://ck.kolivas.org/patches/bfs/${TARGET_KV}/${BFS_SOURCE}.patch"

UNIPATCH_LIST="${DISTDIR}/${BFS_SOURCE}.patch"

SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${BFS_URI}"

EXTRAVERSION="${PVR/#*_p/-bfs}"
KV_FULL="${PVR/_p/-bfs}"
S="${WORKDIR}/linux-${KV_FULL}"

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}
