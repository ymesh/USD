if (${PXR_ENABLE_MATERIALX_SUPPORT})
    link_directories(
        ${MATERIALX_LIB_DIRS}
        ${OIIO_LIBRARY_DIR}
    ) 
endif()

set(DIRS
    usdImaging
    usdImagingGL
    usdProcImaging
    usdRiPxrImaging
    usdSkelImaging
    usdVolImaging
    usdAppUtils
    usdviewq
    bin
    plugin
)

foreach(d ${DIRS})
    add_subdirectory(${d})
endforeach()
