# $NetBSD: Makefile,v 1.7 2018/12/10 11:22:37 adam Exp $

DISTNAME=	munkres-1.0.12
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
#MASTER_SITES=	${MASTER_SITE_PYPI:=m/munkres/}
MASTER_SITES=	${MASTER_SITE_GITHUB:=bmc/}
GITHUB_PROJECT=	munkres
GITHUB_TAG=	release-${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://software.clapper.org/munkres/
COMMENT=	Munkres algorithm for the Assignment Problem
LICENSE=	apache-2.0

TEST_DEPENDS+=	${PYPKGPREFIX}-nose-[0-9]*:../../devel/py-nose

USE_LANGUAGES=	# none
REPLACE_PYTHON=	munkres.py

do-test:
	cd ${WRKSRC} && nosetests-${PYVERSSUFFIX}

.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
