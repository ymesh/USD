# Dependencies for USD: shared libraries (USD's ~40 libraries each link TBB, OpenSubdiv, MaterialX, ...; static copies
# would put one per library in the process, and TBB supports only one), release only, system compiler (GCC).
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_CMAKE_SYSTEM_NAME Linux)
set(VCPKG_BUILD_TYPE release)
set(VCPKG_FIXUP_ELF_RPATH ON)
