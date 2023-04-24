#
# Config USD macOS Renderman
#
USD_VER="23.05"
RMAN_VER="25.0"
PYTHON_VERSION="3"
ARCH="x86_64"

PRMAN_LOCATION="/Applications/Pixar/RenderManProServer-${RMAN_VER}"

# source ./env_python3.9/bin/activate
source /Users/y.meshalkin/data/tools/USD/Pixar/env_py3.9_x86_64/bin/activate

cur_dir=`pwd`
src_dir="${cur_dir}/src"
deploy_root="/Users/y.meshalkin/data/tools/USD/Pixar"
deploy_dir="${deploy_root}/USD_v${USD_VER}_${RMAN_VER}_${ARCH}"

export DOpenColorIO_ROOT=${deploy_dir} 

# homebrew arm64
#export homebrew=/opt/homebrew
# homebrew x86_64
export homebrew=/usr/local/homebrew
export PATH=${homebrew}/bin:${PATH}
export LD_LIBRARY_PATH=${homebrew}/lib:${LD_LIBRARY_PATH}
export DYLD_LIBRARY_PATH=${homebrew}/lib:${DYLD_LIBRARY_PATH}
export DYLD_FALLBACK_LIBRARY_PATH=${homebrew}/lib:${DYLD_FALLBACK_LIBRARY_PATH}

pushd ../build_scripts
# --dry_run \
# --openimageio \
# --force opencolorio \
# --build-args openimageio, -DOpenColorIO_ROOT=${deploy_dir} \
# --build-args openimageio, -DUSE_QT=OFF \
python ./build_usd.py \
--verbose \
--src ${src_dir} \
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