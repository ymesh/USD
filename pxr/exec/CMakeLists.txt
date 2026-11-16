set(DIRS
    vdf
    ef
    esf
    esfUsd
    exec
    execUsd
    execGeom
    execIr
)

# OpenExec currently supports hidden symbol visibility on Linux, but not on
# Apple platforms. Note that CMAKE_CXX_VISIBILITY_PRESET has no effect if the
# compiler is MSVC.
#
# TODO: Hidden symbol visibility breaks the monolithic build on Linux. For now,
# we skip setting hidden symbol visibility in that case. This can be addressed
# and re-enabled in the future.
# Fork: not under Clang. Clang reads ARCH_EXPORT_TYPE as type_visibility, which
# leaves members of explicitly instantiated templates hidden and
# libusd_exec.so fails to load (missing Vdf_VectorImplContiguous<TfToken>
# constructor from libusd_vdf.so).
if(UNIX AND NOT APPLE AND NOT PXR_BUILD_MONOLITHIC
   AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(CMAKE_CXX_VISIBILITY_PRESET hidden)
endif()

foreach(d ${DIRS})
    add_subdirectory(${d})
endforeach()
