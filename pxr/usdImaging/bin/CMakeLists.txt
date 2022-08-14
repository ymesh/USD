set(DIRS
    usdrecord
    usdview
    testusdview
)

foreach(d ${DIRS})
    add_subdirectory(${d})
endforeach()

if (${PXR_ENABLE_MATERIALX_SUPPORT})
    include_directories(${MATERIALX_INCLUDE_DIRS})
    link_directories(${MATERIALX_LIB_DIRS}) 
    add_subdirectory(usdBakeMtlx)
endif()
