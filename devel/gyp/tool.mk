# $NetBSD: tool.mk,v 1.2 2019/04/25 08:09:49 maya Exp $

.if !defined(GYP_TOOL_MK)
GYP_TOOL_MK= defined

PYTHON_VERSIONS_ACCEPTED=	27

# Gyp really wants an executable "python"; this does it
.include "../../lang/python/tool.mk"

.endif #GYP_TOOL_MK
