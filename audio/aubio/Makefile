# $NetBSD: Makefile,v 1.16 2019/04/26 14:12:31 maya Exp $

DISTNAME=	aubio-0.3.2
PKGREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	https://aubio.org/pub/

MAINTAINER=	pho@cielonegro.org
HOMEPAGE=	https://aubio.org/
COMMENT=	Extracting annotations from audio signals
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	aubio.pc.in

# Python related variables:
PY_PATCHPLIST=			yes
REPLACE_PYTHON=	python/aubiocut python/aubiopitch
PYTHON_VERSIONS_INCOMPATIBLE=	36 37 # not yet ported as of 0.3.2

CPPFLAGS.SunOS+=	-Du_int8_t=uint8_t -Du_int16_t=uint16_t -Du_int32_t=uint32_t -Du_int64_t=uint64_t

.include "options.mk"

.include "../../audio/libsamplerate/buildlink3.mk"
.include "../../audio/libsndfile/buildlink3.mk"
.include "../../devel/swig/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../lang/python/extension.mk"
.include "../../math/fftw/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
