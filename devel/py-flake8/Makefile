# $NetBSD: Makefile,v 1.27 2019/05/02 09:16:47 adam Exp $

DISTNAME=	flake8-3.7.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=f/flake8/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://gitlab.com/pycqa/flake8
COMMENT=	Modular source code checker for Python programs
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-codestyle>=2.5.0:../../devel/py-codestyle
DEPENDS+=	${PYPKGPREFIX}-entrypoints>=0.3:../../devel/py-entrypoints
DEPENDS+=	${PYPKGPREFIX}-flakes>=2.1.0:../../devel/py-flakes
DEPENDS+=	${PYPKGPREFIX}-mccabe>=0.6.0:../../devel/py-mccabe
.include "../../lang/python/pyversion.mk"
.if ${_PYTHON_VERSION} == 27
DEPENDS+=	${PYPKGPREFIX}-configparser-[0-9]*:../../devel/py-configparser
DEPENDS+=	${PYPKGPREFIX}-enum34-[0-9]*:../../devel/py-enum34
.endif
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-runner-[0-9]*:../../devel/py-test-runner
TEST_DEPENDS+=	${PYPKGPREFIX}-mock>=2.0.0:../../devel/py-mock
TEST_DEPENDS+=	${PYPKGPREFIX}-test-[0-9]*:../../devel/py-test

USE_LANGUAGES=	# none

post-install:
	cd ${DESTDIR}${PREFIX}/bin && \
	${MV} flake8 flake8-${PYVERSSUFFIX} || ${TRUE}

do-test:
	cd ${WRKSRC} && pytest-${PYVERSSUFFIX}

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
