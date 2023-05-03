#
# Config USD macOS NO Renderman
#
USD_VER="23.05"
RMAN_VER="25.0"
PYTHON_VERSION="3"
ARCH="arm64"

PRMAN_LOCATION="/Applications/Pixar/RenderManProServer-${RMAN_VER}"

source ./env_python3.9/bin/activate
cur_dir=`pwd`
src_dir="${cur_dir}/src"
deploy_dir="/Users/y.meshalkin/data/tools/USD/Pixar"

pushd ../build_scripts

python ./build_usd.py \
--dry_run \
--verbose \
--src ${src_dir} \
--build-target ${ARCH} \
${deploy_dir}/USD_v${USD_VER}_${ARCH}

popd

deactivate