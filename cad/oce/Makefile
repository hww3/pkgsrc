# $NetBSD: Makefile,v 1.7 2018/12/15 21:12:19 wiz Exp $

DISTNAME=	OCE-0.18.3
PKGNAME=	${DISTNAME:tl}
PKGREVISION=	1
CATEGORIES=	cad
MASTER_SITES=	${MASTER_SITE_GITHUB:=tpaviot/}

MAINTAINER=	fhajny@NetBSD.org
HOMEPAGE=	https://github.com/tpaviot/oce/
COMMENT=	Open CASCADE Community Edition
LICENSE=	gnu-lgpl-v2.1

GITHUB_TAG=	${DISTNAME}
WRKSRC=		${WRKDIR}/oce-${DISTNAME}

USE_CMAKE=	yes
USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes

CHECK_PORTABILITY_SKIP+=	samples/qt/*

# mk/configure/cmake.mk disables rpath handling
# but we need it for a lib subpath
LDFLAGS+=	${COMPILER_RPATH_FLAG}${PREFIX}/lib/oce

CMAKE_ARGS+=	-DOCE_INSTALL_PREFIX:PATH=${PREFIX}

SUBST_CLASSES+=		prefix
SUBST_MESSAGE.prefix=	Fixing PREFIX path.
SUBST_STAGE.prefix=	post-configure
SUBST_FILES.prefix=	CMakeFiles/Export/lib/oce/OCE-libraries-release.cmake
SUBST_SED.prefix=	-e "s|${BUILDLINK_DIR}/lib/lib\([0-9a-zA-Z_-]*\)\.so|\1|g"

.include "options.mk"

.include "../../mk/bsd.pkg.mk"
