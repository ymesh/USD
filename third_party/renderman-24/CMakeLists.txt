if (${PXR_ENABLE_MATERIALX_SUPPORT})
    link_directories(
        ${MATERIALX_LIB_DIRS}
        ${OIIO_LIBRARY_DIR}
    ) 
endif()
add_subdirectory(plugin)
add_subdirectory(shaders)
