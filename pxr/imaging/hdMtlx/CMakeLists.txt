set(PXR_PREFIX pxr/imaging)
set(PXR_PACKAGE hdMtlx)

include_directories(${MATERIALX_INCLUDE_DIRS})
link_directories(${MATERIALX_LIB_DIRS}) 

pxr_library(hdMtlx
    LIBRARIES
        gf
        hd
        sdf
        sdr
        tf
        trace
        usdMtlx
        vt
        MaterialXCore
        MaterialXFormat

    PUBLIC_CLASSES
        hdMtlx

    PUBLIC_HEADERS
        api.h
)
