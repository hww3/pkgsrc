# $NetBSD: Makefile,v 1.32 2019/05/08 17:19:41 nia Exp $

DISTNAME=	hexchat-2.14.2
CATEGORIES=	chat
MASTER_SITES=	https://dl.hexchat.net/hexchat/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://hexchat.github.io/
COMMENT=	IRC client based on XChat
LICENSE=	gnu-gpl-v2 AND gnu-lgpl-v2.1 AND mit

USE_LIBTOOL=	yes
USE_TOOLS+=	bison gmake intltool msgfmt msgmerge pkg-config xgettext
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	share/pkgconfig/hexchat-plugin.pc.in

# XXX fails without GNU msgfmt
_TOOLS_USE_PKGSRC.msgfmt=	yes

.include "options.mk"

MESON_ARGS+=		-Dwith-text=true
MESON_ARGS+=		-Dwith-appdata=false

# XXX meson
PYTHON_VERSIONS_INCOMPATIBLE=	27
.if empty(PKG_OPTIONS:Mpython)
PYTHON_FOR_BUILD_ONLY=	yes
.endif
.include "../../lang/python/pyversion.mk"
REPLACE_PYTHON+=	plugins/perl/generate_header.py
REPLACE_PYTHON+=	src/common/make-te.py
REPLACE_PYTHON+=	meson_post_install.py

OPSYSVARS+=		SOEXT
SOEXT.Darwin=		dylib
SOEXT.*=		so
PLIST_SUBST+=		SOEXT=${SOEXT}

LDFLAGS.SunOS+=		-lsocket -lnsl

# I have no idea why it sometimes isn't doing this, causing the build
# to fail without the generated files.
post-configure:
	${PYTHONBIN} ${WRKSRC}/src/common/make-te.py \
		${WRKSRC}/src/common/textevents.in \
		${WRKSRC}/src/common/textevents.h \
		${WRKSRC}/src/common/textenums.h
	cd ${WRKSRC} && ${PREFIX}/bin/glib-genmarshal \
		--prefix _hexchat_marshal --internal \
		--output src/common/marshal.c \
		--body src/common/marshalers.list \
		--include-header marshal.h


.include "../../devel/py-meson/build.mk"
.include "../../textproc/iso-codes/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
