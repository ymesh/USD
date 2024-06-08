#
# Config USD linux ABI_0 Renderman
#
USD_VER="24.05"
RMAN_VER="26.0"
PY_VER="3.10"

PRMAN_LOCATION="/opt/pixar/RenderManProServer-${RMAN_VER}"

source ../../venv${PY_VER}/bin/activate

cur_dir=`pwd`
deploy_root="/data/tools"
deploy_dir="${deploy_root}/USD/pixar/USD-v${USD_VER}_rman${RMAN_VER}_ABI_0_py${PY_VER}"
build_dir="${deploy_root}/USD/pixar/build_v${USD_VER}_rman${RMAN_VER}_ABI_0_py${PY_VER}"
src_dir="${deploy_root}/USD/pixar/src"

CMAKE_LOCATION=/usr/local/cmake-3.28.3
export CMAKE_ROOT=/usr/local/cmake-3.28.3/share/cmake-3.28
export PATH=${CMAKE_LOCATION}/bin:${PATH}

pushd ../build_scripts
# --dry_run \
# --openimageio \
# --force opencolorio \
# --build-args openimageio, -DOpenColorIO_ROOT=${deploy_dir} \
# --build-args openimageio, -DUSE_QT=OFF \
# --build-args USD, -DPXR_PY_UNDEFINED_DYNAMIC_LOOKUP=OFF \
# --force boost \
# -fno-lto ???
export LDFLAGS=-fno-lto
python ./build_usd.py \
--verbose \
--src ${src_dir} \
--build ${build_dir} \
--generator "Unix Makefiles" \
--use-cxx11-abi 0 \
--ptex \
--openvdb \
--prman \
--prman-location ${PRMAN_LOCATION} \
--openimageio \
--opencolorio \
--alembic \
--hdf5 \
--materialx \
${deploy_dir}

popd

deactivate