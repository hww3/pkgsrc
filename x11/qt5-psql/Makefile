# $NetBSD: Makefile,v 1.37 2019/04/25 19:43:15 adam Exp $

DISTNAME=	qtbase-everywhere-src-${QTVERSION}
PKGNAME=	qt5-psql-${QTVERSION}
COMMENT=	Qt5 PostgreSQL plugin

BUILD_QT5=		yes

BUILD_DIRS=		src/plugins/sqldrivers
MAKE_ENV+=		QTDIR=${QTDIR}
INSTALL_ENV+=		INSTALL_ROOT=${DESTDIR}

.include "../../x11/qt5-qtbase/Makefile.common"

do-configure:
	${RM} -f -r ${WRKSRC}/mkspecs
	cd ${WRKSRC}/${BUILD_DIRS} && \
	${QTDIR}/bin/qmake -o Makefile "QT.sql.enabled_features+=sql-psql" "QMAKE_LIBS_PSQL=-lpq"

post-install:
	rm -f ${DESTDIR}${PREFIX}/qt5/lib/cmake/Qt5Sql/Qt5Sql_QSQLiteDriverPlugin.cmake
	rm -f ${DESTDIR}${PREFIX}/qt5/plugins/sqldrivers/libqsqlite.*

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/pgsql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
