# $NetBSD: Makefile,v 1.15 2019/02/22 14:07:38 wen Exp $
#

DISTNAME=	Geo-ShapeFile-2.66
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	geography perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Geo/}

MAINTAINER=	wen@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Geo-ShapeFile/
COMMENT=	Perl extension for handling ESRI GIS Shapefiles
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Tree-R>=0:../../devel/p5-Tree-R
DEPENDS+=	p5-autovivification>=0:../../devel/p5-autovivification

PERL5_PACKLIST=	auto/Geo/ShapeFile/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
