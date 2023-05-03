set(PXR_PREFIX pxr/imaging)
set(PXR_PACKAGE hioOiio)

if (NOT ${PXR_BUILD_GPU_SUPPORT})
    message(STATUS
            "Skipping ${PXR_PACKAGE} because PXR_BUILD_GPU_SUPPORT is OFF")
    return()
endif()

# Use the import targets set by Imath's package config
if (Imath_FOUND)
    set(__OIIO_IMATH_LIBS "Imath::Imath")
else()
    set(__OIIO_IMATH_INCLUDE ${OPENEXR_INCLUDE_DIRS})
    set(__OIIO_IMATH_LIBS ${OPENEXR_LIBRARIES})
endif()

message ("*** OIIO_LIBRARIES = ${OIIO_LIBRARIES}")
message ("*** __OIIO_IMATH_LIBS = ${__OIIO_IMATH_LIBS}")

pxr_plugin(hioOiio
    LIBRARIES
        ar
        arch
        gf
        hio
        tf
        ${OIIO_LIBRARIES}
        ${__OIIO_IMATH_LIBS}

    INCLUDE_DIRS
        ${OIIO_INCLUDE_DIRS}
        ${__OIIO_IMATH_INCLUDE}

    CPPFILES
        oiioImage.cpp
        metadata.cpp

    RESOURCE_FILES
        plugInfo.json
)
