#
# Config USD macOS Renderman
#
USD_VER="24.05"
RMAN_VER="26.1"
PY_VER="3.12"
ARCH="x86_64"
PRMAN_LOCATION="/Applications/Pixar/RenderManProServer-${RMAN_VER}"

source ../../venv${PY_VER}_x86/bin/activate

cur_dir=`pwd`
deploy_root="/Users/mesh/data/tools/USD/Pixar"
deploy_dir="${deploy_root}/USD_v${USD_VER}_${RMAN_VER}_py${PY_VER}_${ARCH}"
build_dir="${deploy_root}/build_v${USD_VER}_rman${RMAN_VER}_py${PY_VER}_${ARCH}"
src_dir="${deploy_root}/src"

export DOpenColorIO_ROOT=${deploy_dir} 

# homebrew arm64
# export homebrew=/opt/homebrew
# homebrew x86_64
export homebrew=/usr/local/homebrew
export PATH=${homebrew}/bin:${PATH}
export LD_LIBRARY_PATH=${homebrew}/lib:${LD_LIBRARY_PATH}
export DYLD_LIBRARY_PATH=${homebrew}/lib:${DYLD_LIBRARY_PATH}
export DYLD_FALLBACK_LIBRARY_PATH=${homebrew}/lib:${DYLD_FALLBACK_LIBRARY_PATH}
export CMAKE_ROOT=${homebrew}/share/cmake

# export HDF5_ROOT=/Users/mesh/data/tools/USD/Pixar/src/hdf5-1.14.4-3
# export HDF5_DIR=${HDF5_ROOT}/config/cmake
# export HDF5_INCLUDE_DIRS=${deploy_dir}/include
# arch -x86_64
pushd ../build_scripts
# --dry_run \
# --openimageio \
# --force opencolorio \
# --build-args openimageio, -DOpenColorIO_ROOT=${deploy_dir} \
# --build-args openimageio, -DUSE_QT=OFF \
python ./build_usd.py \
--verbose \
--src ${src_dir} \
--build ${build_dir} \
--build-target ${ARCH} \
--generator "Unix Makefiles" \
--ptex \
--openvdb \
--prman \
--prman-location ${PRMAN_LOCATION} \
--opencolorio \
--openimageio \
--alembic \
--hdf5 \
--materialx \
${deploy_dir}

popd

deactivate