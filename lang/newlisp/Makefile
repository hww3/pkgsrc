# $NetBSD: Makefile,v 1.12 2019/04/24 13:09:45 hauke Exp $
#

DISTNAME=	newlisp-10.7.1
CATEGORIES=	lang
MASTER_SITES=	http://www.newlisp.org/downloads/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	http://www.newlisp.org/
COMMENT=	Lisp-like, general-purpose scripting language
LICENSE=	gnu-gpl-v3

HAS_CONFIGURE=		yes
CONFIGURE_SCRIPT=	configure-alt
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--mandir=${PREFIX}/${PKGMANDIR}
CONFIGURE_ARGS+=	--enable-readline

USE_JAVA=	run
USE_JAVA2=	yes

SUBST_CLASSES+=		java
SUBST_FILES.java=	guiserver/guiserver.lsp
SUBST_STAGE.java=	pre-configure
SUBST_SED.java=		-e 's,@JAVA_HOME@,${PKG_JAVA_HOME},g'

SUBST_CLASSES+=			interpreter
SUBST_STAGE.interpreter=	pre-configure
SUBST_MESSAGE.interpreter=	Fix shebang
SUBST_FILES.interpreter=	guiserver/*lsp util/syntax.cgi util/newlispdoc
SUBST_SED.interpreter=		-e 's,/usr/bin/newlisp,${PREFIX}/bin/newlisp,'
SUBST_SED.interpreter+=		-e 's,/usr/local/bin/newlisp,${PREFIX}/bin/newlisp,'
SUBST_SED.interpreter+=		-e 's,/usr/bin/env newlisp,${PREFIX}/bin/newlisp,'

.include "../../mk/readline.buildlink3.mk"
.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
