# $NetBSD: Makefile,v 1.4 2019/05/08 12:40:05 nia Exp $

DISTNAME=	libretro-core-info-${RETROARCH_VERSION}
CATEGORIES=	emulators
MASTER_SITES=	${MASTER_SITE_GITHUB:=libretro/}
GITHUB_TAG=	v${RETROARCH_VERSION}

MAINTAINER=	nia@NetBSD.org
HOMEPAGE=	https://www.libretro.com/
COMMENT=	Libretro core information
LICENSE=	public-domain

EXTRACT_USING=	bsdtar
USE_LANGUAGES=	# none
NO_BUILD=	yes

INSTALLATION_DIRS+=	${PREFIX}/share/libretro/info

do-install:
	${INSTALL_DATA} ${WRKSRC}/*.info ${DESTDIR}${PREFIX}/share/libretro/info

.include "../../emulators/retroarch/version.mk"
.include "../../mk/bsd.pkg.mk"
