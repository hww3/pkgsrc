# $NetBSD: Makefile,v 1.1 2019/03/19 11:11:31 jaapb Exp $

GITHUB_PROJECT=	ocaml-cstruct
GITHUB_TAG=	v${PKGVERSION_NOREV}
DISTNAME=	${GITHUB_PROJECT}-3.7.0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=mirage/}

MAINTAINER=	jaapb@NetBSD.org
HOMEPAGE=	https://github.com/mirage/ocaml-cstruct/
COMMENT=	Map OCaml arrays onto C-like structs
LICENSE=	isc

OCAML_USE_DUNE=	yes
DUNE_BUILD_PACKAGES=	cstruct cstruct-unix
OPAM_INSTALL_FILES=	cstruct cstruct-unix

.include "../../devel/ocaml-sexplib/buildlink3.mk"
.include "../../mk/ocaml.mk"
.include "../../mk/bsd.pkg.mk"
