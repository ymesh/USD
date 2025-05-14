#
# Config USD linux Renderman
#
USD_VER="25.05"
RMAN_VER="26.3"
PY_VER="3.10"

PRMAN_LOCATION="/opt/pixar/RenderManProServer-${RMAN_VER}"

source ../../venv${PY_VER}/bin/activate

cur_dir=`pwd`
deploy_root="/data/tools"
deploy_dir="${deploy_root}/USD/pixar/USD-v${USD_VER}_rman${RMAN_VER}_py${PY_VER}_vulkan"
build_dir="${deploy_root}/USD/pixar/build_v${USD_VER}_rman${RMAN_VER}_py${PY_VER}_vulkan"
src_dir="${deploy_root}/USD/pixar/src"

# CMAKE_LOCATION=/usr/local/cmake-3.28.3
# export CMAKE_ROOT=/usr/local/cmake-3.28.3/share/cmake-3.28
# export PATH=${CMAKE_LOCATION}/bin:${PATH}

export TBBROOT=${deploy_dir}
export LD_LIBRARY_PATH=${deploy_dir}/lib:${LD_LIBRARY_PATH}
export VULKAN_SDK="/home/data/code/LIBS/Vulkan/SDK/1.4.313.0/x86_64"

pushd ../build_scripts
# --dry_run \
# --openimageio \
# --force opencolorio \
# --build-args openimageio, -DOpenColorIO_ROOT=${deploy_dir} \
# --build-args openimageio, -DUSE_QT=OFF \
# --build-args USD, -DPXR_PY_UNDEFINED_DYNAMIC_LOOKUP=OFF \
# --prman \
# --prman-location ${PRMAN_LOCATION} \
# --use-cxx11-abi 0 \
# --force boost \
# -fno-lto ???
# --force boost \
# --boost-python \
# --openimageio \
# --opencolorio \
# --build-args USD, "-DTBB_ROOT_DIR=${deploy_dir}" \
export LDFLAGS=-fno-lto
python ./build_usd.py \
--verbose \
--src ${src_dir} \
--build ${build_dir} \
--generator "Unix Makefiles" \
--no-onetbb \
--vulkan \
--ptex \
--openvdb \
--openimageio \
--opencolorio \
--prman \
--prman-location ${PRMAN_LOCATION} \
--alembic \
--hdf5 \
--materialx ${deploy_dir}

popd

deactivate