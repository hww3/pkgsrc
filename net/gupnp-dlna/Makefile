# $NetBSD: Makefile,v 1.26 2019/04/03 00:32:58 ryoon Exp $

DISTNAME=	gupnp-dlna-0.10.3
PKGREVISION=	12
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/gupnp-dlna/0.10/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.gupnp.org/
COMMENT=	GUPnP DLNA is a small DLNA-related utility library
LICENSE=	gnu-lgpl-v2.1

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	gmake pkg-config

PKGCONFIG_OVERRIDE+=	gupnp-dlna-2.0.pc.in
PKGCONFIG_OVERRIDE+=	gupnp-dlna-gst-2.0.pc.in
#PKGCONFIG_OVERRIDE+=	gupnp-dlna-metadata-2.0.pc.in

.include "../../archivers/xz/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../net/gupnp/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../multimedia/gstreamer1/buildlink3.mk"
.include "../../multimedia/gst-plugins1-base/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
