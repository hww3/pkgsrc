# $NetBSD: Makefile,v 1.17 2018/08/22 09:44:30 wiz Exp $
#

DISTNAME=	Parse-ErrorString-Perl-0.27
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Parse/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Parse-ErrorString-Perl/
COMMENT=	Parse error messages from the perl interpreter
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Class-XSAccessor-[0-9]*:../../devel/p5-Class-XSAccessor
DEPENDS+=	p5-Pod-POM-[0-9]*:../../textproc/p5-Pod-POM

BUILD_DEPENDS+=	p5-Test-Differences-[0-9]*:../../devel/p5-Test-Differences

MAKE_ENV+=		PERL_USE_UNSAFE_INC=1
PERL5_PACKLIST=		auto/Parse/ErrorString/Perl/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
