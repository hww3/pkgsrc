# $NetBSD: Makefile,v 1.11 2019/04/16 18:41:11 bsiegert Exp $

# Making up a version number, as this is a snapshot after the latest release
DISTNAME=	crypt-0.0.2b
PKGNAME=	go-${DISTNAME}
PKGREVISION=	9
MASTER_SITES=	${MASTER_SITE_GITHUB:=xordataexchange/}
CATEGORIES=	security
GITHUB_TAG=	749e360c8f236773f28fc6d3ddfce4a470795227
GITHUB_PROJECT= ${PKGBASE:S/^go-//}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://xordataexchange.github.io/crypt/
COMMENT=	Store and retrieve encrypted configs from etcd or consul
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/xordataexchange/crypt

.include "../../devel/go-consul-api/buildlink3.mk"
.include "../../databases/go-etcd/buildlink3.mk"
.include "../../security/go-crypto/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
