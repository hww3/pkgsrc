# $NetBSD: Makefile,v 1.7 2019/04/29 08:48:10 adam Exp $

DISTNAME=	soupsieve-1.9.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	www python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/soupsieve/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/facelessuser/soupsieve
COMMENT=	CSS4 selector implementation for Beautiful Soup
LICENSE=	mit

.include "../../lang/python/pyversion.mk"
.if ${_PYTHON_VERSION} == 27
DEPENDS+=	${PYPKGPREFIX}-backports.functools_lru_cache-[0-9]*:../../devel/py-backports.functools_lru_cache
.endif

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
