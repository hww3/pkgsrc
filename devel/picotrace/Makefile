# $NetBSD: Makefile,v 1.2 2019/05/07 09:33:13 leot Exp $

DISTNAME=	picotrace-20190507
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=krytarowski/}
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	kamil@NetBSD.org
HOMEPAGE=	https://github.com/krytarowski/picotrace/
COMMENT=	System call process tracer
LICENSE=	2-clause-bsd

ONLY_FOR_PLATFORM=	NetBSD-*-*

USE_BSD_MAKEFILE=	yes
USE_TOOLS+=		nroff

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

.include "../../mk/bsd.pkg.mk"
