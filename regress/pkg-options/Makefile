# $NetBSD: Makefile,v 1.8 2019/03/24 20:57:59 rillig Exp $
#

DISTNAME=	regress-pkg-options-1.0
CATEGORIES=	regress
DISTFILES=	# empty

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Test bsd.options.mk framework

REGRESS_TESTS=	all group-required groups legacy-opt order sets
REGRESS_TESTS+=	simple unsupported

do-test:
.for t in ${REGRESS_TESTS}
	@${_PKG_SILENT}${_PKG_DEBUG}					\
	${ECHO_MSG} "Running testcase "${t:Q};				\
	${MAKE} ${MAKEFLAGS} -s -f ${FILESDIR:Q}/${t:Q}.mk test		\
	| diff -u ${FILESDIR:Q}/${t:Q}.out -
.endfor

.include "../../mk/bsd.pkg.mk"
