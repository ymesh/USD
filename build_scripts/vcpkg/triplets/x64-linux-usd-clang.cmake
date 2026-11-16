# x64-linux-usd built with Clang: same linkage rules, every port compiled through the Clang toolchain file.
include("${CMAKE_CURRENT_LIST_DIR}/x64-linux-usd.cmake")
set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${CMAKE_CURRENT_LIST_DIR}/../toolchains/linux-clang.cmake")
