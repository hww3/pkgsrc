# $NetBSD: Makefile,v 1.66 2019/04/25 07:33:23 maya Exp $

VERSION=	4.5.5
PKGREVISION=	15
VERSION_IPXE=	9a93db3f0947484e30e753bbd61a10b17336e20e

DISTNAME=		xen-${VERSION}
PKGNAME=		xentools45-${VERSION}
CATEGORIES=		sysutils
MASTER_SITES=		http://bits.xensource.com/oss-xen/release/${VERSION}/

DISTFILES=		${DISTNAME}.tar.gz
DISTFILES+=		ipxe-git-${VERSION_IPXE}.tar.gz
SITES.ipxe-git-${VERSION_IPXE}.tar.gz +=	http://xenbits.xensource.com/xen-extfiles/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://xen.org/
COMMENT=		Userland Tools for Xen 4.5.x
LICENSE=		gnu-gpl-v2

# XXX add version check: Xen requires dev86 >= 0.16.14
BUILD_DEPENDS+= dev86-[0-9]*:../../devel/dev86 # needed to build firmware
.if !exists(/usr/bin/iasl)
BUILD_DEPENDS+= acpica-utils-[0-9]*:../../sysutils/acpica-utils
.endif
DEPENDS+=   ${PYPKGPREFIX}-curses>=0:../../devel/py-curses

PKG_SYSCONFSUBDIR=	xen

ONLY_FOR_PLATFORM=	Linux-2.6*-x86_64
ONLY_FOR_PLATFORM+=	NetBSD-[5-9].*-x86_64

SSP_SUPPORTED=		no

CONFLICTS+=		libxen-[0-9]*
CONFLICTS+=		xenstoretools-[0-9]*

XENTOP=			${WRKDIR}/xen-${VERSION}
WRKSRC=			${XENTOP}/tools
CHECK_PORTABILITY_SKIP=	examples/*
CHECK_RELRO_SKIP=	libexec/xen/boot/hvmloader

EGDIR=			${PREFIX}/share/examples/xen
MESSAGE_SUBST+=		EGDIR=${EGDIR}

USE_TOOLS+=		pod2man gmake pkg-config makeinfo perl bash

GNU_CONFIGURE=		YES
#CONFIGURE_ARGS+=	--enable-xenapi
CONFIGURE_ARGS+=	--disable-seabios

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFBASE}

MAKE_ENV+=		PREFIX=${prefix:Q} WRKSRC=${WRKSRC}
MAKE_ENV+=		APPEND_LIB=${LDFLAGS:Q}
MAKE_ENV+=		XEN_EXAMPLES_DIR=${EGDIR}
MAKE_ENV+=		MV=${MV:Q} PYTHON=${PYTHONBIN:Q} SED=${SED:Q}
MAKE_ENV+=		V=YES
MAKE_ENV+=		NO_WERROR=1

#MAKE_ENV+=		INSTALL_DIR=${BSD_INSTALL_DATA_DIR}
#MAKE_ENV+=		INSTALL_DATA=${BSD_INSTALL_DATA}
#MAKE_ENV+=		INSTALL_PROG=${BSD_INSTALL_PROGRAM}

PYTHON_VERSIONS_ACCEPTED=	27

PY_PATCHPLIST=		yes
REPLACE_PYTHON+=	misc/sbdf2devicepath misc/xen-bugtool
REPLACE_PYTHON+=	misc/xen-ringwatch misc/xencons
REPLACE_PYTHON+=	misc/xenpvnetboot misc/xensymoops
REPLACE_PYTHON+=	xenmon/xenmon.py

SUBST_CLASSES+=		perlpath
SUBST_STAGE.perlpath=	pre-configure
SUBST_FILES.perlpath=	../tools/misc/xencov_split
SUBST_FILES.perlpath+=	../tools/firmware/rombios/makesym.perl
SUBST_FILES.perlpath+=	../tools/qemu-xen-traditional/texi2pod.pl
SUBST_FILES.perlpath+=	../tools/examples/xeninfo.pl
SUBST_FILES.perlpath+=	../tools/include/xen-external/bsd-sys-queue-h-seddery
SUBST_FILES.perlpath+=	../tools/qemu-xen/scripts/texi2pod.pl
SUBST_FILES.perlpath+=	../tools/qemu-xen/scripts/get_maintainer.pl
SUBST_FILES.perlpath+=	../tools/qemu-xen/scripts/checkpatch.pl
SUBST_FILES.perlpath+=	../tools/libxl/libxl_save_msgs_gen.pl
SUBST_FILES.perlpath+=	../tools/libxl/check-libxl-api-rules
SUBST_FILES.perlpath+=	../../ipxe/src/drivers/infiniband/qib_genbits.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/catrom.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/diffsize.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/disrom.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/get-pci-ids
SUBST_FILES.perlpath+=	../../ipxe/src/util/licence.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/mergerom.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/modrom.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/padimg.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/parserom.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/sortobjdump.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/swapdevids.pl
SUBST_FILES.perlpath+=	../../ipxe/src/util/symcheck.pl
SUBST_SED.perlpath=	-e "s|/usr/bin/perl|${PREFIX}/bin/perl|g"

SUBST_CLASSES+=		pathsvar
SUBST_STAGE.pathsvar=	pre-configure
SUBST_FILES.pathsvar=	Makefile \
			hotplug/Linux/init.d/sysconfig.xendomains
SUBST_SED.pathsvar=	-e "s|/var/lib|${VARBASE}/run|g"

SUBST_CLASSES+=		conf
SUBST_STAGE.conf=	pre-configure
SUBST_FILES.conf+=	ocaml/xenstored/define.ml
SUBST_FILES.conf+=	libxl/xl_cmdtable.c
SUBST_FILES.conf+=	../docs/misc/xl-disk-configuration.txt
SUBST_SED.conf=		-e "s,@XENDCONFDIR@,${PKG_SYSCONFDIR},g"

XEND_SCRIPTS=		block vif-bridge vif-ip qemu-ifup hotplugpath.sh locking.sh

SUBST_CLASSES.NetBSD+=	proc
SUBST_STAGE.proc=	pre-configure
SUBST_FILES.proc+=	ocaml/xenstored/define.ml
SUBST_SED.proc=		-e "s|/proc|/kern|g"

OPSYSVARS+=		PROCPATH
PROCPATH.NetBSD=	/kern
PROCPATH.*=		/proc

.include "../../mk/bsd.prefs.mk"

SUBST_CLASSES+=		procdev
SUBST_STAGE.procdev=	pre-configure
SUBST_FILES.procdev=	ocaml/xenstored/define.ml
.if ${OPSYS} == "NetBSD"
SUBST_SED.procdev=	-e "s|@PROCDEV@|/dev|g"
.else
SUBST_SED.procdev=	-e "s|@PROCDEV@|/proc/xen|g"
.endif

.if ${OPSYS} == "NetBSD"
MESSAGE_SRC=		${.CURDIR}/MESSAGE ${.CURDIR}/MESSAGE.NetBSD
.endif

RCD_SCRIPTS=		xen-watchdog xencommons xendomains
FILES_SUBST+=		RCD_INTERPRETER=${PYTHONBIN:Q}
FILES_SUBST+=		PROCPATH=${PROCPATH:Q}
FILES_SUBST+=		PKG_SYSCONFDIR=${PKG_SYSCONFDIR}
FILES_SUBST+=		PREFIX=${PREFIX}

BLKTAP_FILES=		blk_netbsd.c blktapctrl_netbsd.c

CONF_FILES+=		${EGDIR}/xl.conf ${PKG_SYSCONFDIR}/xl.conf
CONF_FILES+=		${EGDIR}/oxenstored.conf ${PKG_SYSCONFDIR}/oxenstored.conf

OWN_DIRS=		${PKG_SYSCONFDIR}/scripts ${VARBASE}/log/xen
OWN_DIRS+=		${VARBASE}/lib/xen

.for s in ${XEND_SCRIPTS}
CONF_FILES_PERMS+=	${EGDIR}/scripts/${s} ${PKG_SYSCONFDIR}/scripts/${s} \
			${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 0755
.endfor

pre-build:
	rm -f ${WRKSRC}/check/check_x11_devel
.for s in ${BLKTAP_FILES}
	${CP} -f ${FILESDIR}/${s} ${WRKSRC}/blktap/drivers/
.endfor
	${CP} -f ${FILESDIR}/locking.sh  ${WRKSRC}/hotplug/NetBSD/
	${SED} -e "s,@XENDCONFDIR@,${PKG_SYSCONFDIR},g" \
		${XENTOP}/docs/man/xenstore-chmod.pod.1 |\
	    pod2man -n xenstore-chmod >${WRKDIR}/xenstore-chmod.1
	${SED} -e "s,@XENDCONFDIR@,${PKG_SYSCONFDIR},g" \
		${XENTOP}/docs/man/xenstore-ls.pod.1 |\
	    pod2man -n xenstore-ls >${WRKDIR}/xenstore-ls.1
	${SED} -e "s,@XENDCONFDIR@,${PKG_SYSCONFDIR},g" \
		${XENTOP}/docs/man/xenstore.pod.1 |\
	    pod2man -n xenstore >${WRKDIR}/xenstore.1
	${SED} -e "s,@XENDCONFDIR@,${PKG_SYSCONFDIR},g" \
		${XENTOP}/docs/man/xl.cfg.pod.5 |\
	    pod2man -n xl.cfg >${WRKDIR}/xl.cfg.5
	${SED} -e "s,@XENDCONFDIR@,${PKG_SYSCONFDIR},g" \
		${XENTOP}/docs/man/xl.conf.pod.5 |\
	    pod2man -n xl.conf >${WRKDIR}/xl.conf.5
	${SED} -e "s,@XENDCONFDIR@,${PKG_SYSCONFDIR},g" \
		${XENTOP}/docs/man/xl.pod.1 |\
	    pod2man -n xl >${WRKDIR}/xl.1
	${SED} -e "s,@XENDCONFDIR@,${PKG_SYSCONFDIR},g" \
		${XENTOP}/docs/man/xlcpupool.cfg.pod.5 |\
	    pod2man -n xlcpupool.cfg >${WRKDIR}/xlcpupool.cfg.5

INSTALLATION_DIRS=	${EGDIR} ${PKGMANDIR}/man5

BUILD_DEFS+=		VARBASE

post-install:
	${INSTALL_DATA} ${WRKDIR}/xenstore-chmod.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${INSTALL_DATA} ${WRKDIR}/xenstore-ls.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${INSTALL_DATA} ${WRKDIR}/xenstore.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${INSTALL_DATA} ${WRKDIR}/xl.cfg.5 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man5
	${INSTALL_DATA} ${WRKDIR}/xl.conf.5 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man5
	${INSTALL_DATA} ${WRKDIR}/xl.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${INSTALL_DATA} ${WRKDIR}/xlcpupool.cfg.5 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man5
	${INSTALL_DATA} ${XENTOP}/docs/misc/xen-command-line.markdown ${DESTDIR}${PREFIX}/share/doc/xen
	${INSTALL_DATA} ${XENTOP}/docs/misc/xl-disk-configuration.txt ${DESTDIR}${PREFIX}/share/doc/xen
	${INSTALL_DATA} ${XENTOP}/docs/misc/xl-network-configuration.markdown ${DESTDIR}${PREFIX}/share/doc/xen

.if (${OPSYS} == "NetBSD" && \
    (empty(OS_VERSION:M6.99.[3-9]?) && empty(OS_VERSION:M[7-9].*)))
CPPFLAGS+=	-Dshm_open=open -Dshm_unlink=unlink
.endif

.include "../../mk/compiler.mk"
.if !empty(PKGSRC_COMPILER:Mclang)
EXTRA_HOSTCFLAGS+=	-Wno-error=ignored-attributes
EXTRA_CFLAGS+=	-Wno-error=ignored-attributes -no-integrated-as \
		-Wno-error=tautological-compare -Wno-error=null-dereference \
		-Wno-error=empty-body -Wno-error=self-assign \
		-Wno-error=sometimes-uninitialized \
		-Wno-error=unused-function -Wno-error=format \
		-Wno-error=unused-const-variable \
		-Wno-error=gnu-designator -Wno-error=uninitialized \
		-Wno-error=parentheses-equality \
		-Wno-error=enum-conversion \
		-Wno-error=address-of-packed-member
BUILDLINK_TRANSFORM+=	rm:-falign-jumps=1 rm:-falign-loops=1 \
			rm:-mpreferred-stack-boundary=2
.endif

MAKE_ENV+=	EXTRA_HOSTCFLAGS=${EXTRA_HOSTCFLAGS:Q} EXTRA_CFLAGS=${EXTRA_CFLAGS:M*:Q}

.include "../../lang/python/application.mk"
.include "../../lang/python/extension.mk"
#.include "../../devel/SDL/buildlink3.mk"
.include "../../lang/ocaml/buildlink3.mk"
.include "../../devel/ocaml-findlib/buildlink3.mk"
.include "../../sysutils/pciutils/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/yajl/buildlink3.mk"
.include "../../x11/pixman/buildlink3.mk"

.include "../../mk/curses.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
