# $NetBSD: Makefile,v 1.28 2018/12/27 16:02:22 joerg Exp $

DISTNAME=	python-driver-3.15.1
PKGNAME=	${DISTNAME:S/python/${PYPKGPREFIX}-cassandra/}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=datastax/}
GITHUB_PROJECT=	python-driver

MAINTAINER=	fhajny@NetBSD.org
HOMEPAGE=	https://github.com/datastax/python-driver/
COMMENT=	DataStax Python Driver for Apache Cassandra
LICENSE=	apache-2.0

EGG_NAME=	cassandra_driver-${PKGVERSION_NOREV}

PYTHON_VERSIONS_INCOMPATIBLE=	27

.include "../../lang/python/pyversion.mk"

DEPENDS+=	${PYPKGPREFIX}-cython>=0.28:../../devel/py-cython
DEPENDS+=	${PYPKGPREFIX}-six>=1.9:../../lang/py-six

# Remove if upstream stops being obsessive about Cython version
MAKE_ENV+=	CASS_DRIVER_ALLOWED_CYTHON_VERSION=0.*

.include "../../devel/libev/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
