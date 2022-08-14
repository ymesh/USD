if (${PXR_ENABLE_MATERIALX_SUPPORT})
    link_directories(${MATERIALX_LIB_DIRS}) 
endif()

set(DIRS
    usdImaging
    usdImagingGL
    usdProcImaging
    usdRiImaging
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
