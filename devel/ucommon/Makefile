# $NetBSD: Makefile,v 1.14 2019/01/13 18:21:24 adam Exp $

DISTNAME=	ucommon-7.0.0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU:=commoncpp/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.gnu.org/software/commoncpp/
COMMENT=	Very light-weight C++ library for deeply embedded applications
LICENSE=	gnu-lgpl-v3

USE_CMAKE=		yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		intltool pkg-config
#USE_LIBTOOL=		yes
PKGCONFIG_OVERRIDE+=	commoncpp.pc.in
PKGCONFIG_OVERRIDE+=	ucommon.pc.in

.include "options.mk"

LDFLAGS.SunOS+=		-lsocket -lnsl -lintl

.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
