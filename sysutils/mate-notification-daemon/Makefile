# $NetBSD: Makefile,v 1.14 2019/04/25 07:33:19 maya Exp $

PKGREVISION= 1
.include "../../meta-pkgs/mate/Makefile.common"

DISTNAME=	mate-notification-daemon-${VERSION}
CATEGORIES=	sysutils

COMMENT=	Notification daemon for MATE desktop

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../audio/libcanberra/buildlink3.mk"
.include "../../devel/libwnck3/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../sysutils/dbus-glib/buildlink3.mk"
.include "../../sysutils/libnotify/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
