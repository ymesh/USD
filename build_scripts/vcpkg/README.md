# Building USD with vcpkg dependencies

A replacement for `build_scripts/build_usd.py`. vcpkg builds the third-party libraries from the sources it has already
downloaded in `$VCPKG_ROOT/downloads`, and USD itself is built from this checkout with plain CMake
(`CMakePresets.json` at the repo root).

```bash
build_scripts/vcpkg/build.sh            # system GCC
build_scripts/vcpkg/build.sh --clang    # Clang for USD and every port, separate *_clang folders
build_scripts/vcpkg/build.sh --clean    # reconfigure USD (keeps the built vcpkg packages)
```

The result goes into `/data/tools/USD/pixar` (override with `USD_TOOLS_DIR`):

| Path | Contents |
|---|---|
| `USD-v<USD>_rman<RMAN>_py<PY>_vulkan/` | install: USD, dependency `.so` files copied into `lib/`, MaterialX `libraries/` |
| `build_v<USD>_rman<RMAN>_py<PY>_vulkan/` | `USD/` build tree, `vcpkg_installed/` packages, `build.log` |
| `set_env_usd_<USD>_rman<RMAN>_py<PY>_vulkan.sh` | `source` it to use the install |

`USD_VER` is read from `cmake/defaults/Version.cmake`. `RMAN_VER` defaults to `27.3` (`/opt/pixar/RenderManProServer-<ver>`,
`~/env/rman/env_rman.sh`). `USD_VENV` defaults to `/data/code/me/venv3.14`, and the Python version is taken from it.

## Prerequisites

- `VCPKG_ROOT` (default `/data/code/libs/vcpkg`), bootstrapped.
- A Python built with `--enable-shared` (USD's bindings link libpython). Install `PySide6 PyOpenGL Jinja2` in the venv for usdview,
  plus `opencolorio==<the OCIO version in vcpkg_installed>` (2.6.x now) for usdview's color management menu.
  vcpkg's opencolorio port has no Python bindings.
- CMake 3.26+, Ninja, plus the system GL/X11/Vulkan loader development packages (see Lila's BUILD.md for the Rocky 9 list).

## Files

- `vcpkg.json`: the dependency manifest. `builtin-baseline` is the same as Lila's, so both use the same port versions and tarballs.
- `triplets/x64-linux-usd*.cmake`: shared libraries, release-only builds.
- `toolchains/linux-clang.cmake`: the Clang toolchain chainloaded by the `linux-clang` preset.
- `cmake/defaults/Packages.cmake`: without `VULKAN_SDK`, Vulkan and shaderc come from the packages (`unofficial-shaderc`).

Don't run this while a Lila build is running. Both use `$VCPKG_ROOT/buildtrees` and `packages`.
