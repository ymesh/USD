#
# Setup USD working environment
#
export USD_VER="24.05"
PYTHON_VERSION="3"
PY_VER=3.10
tools="/home/data/tools"
usd_dir="${tools}/USD"

source "/home/data/code/me/venv${PY_VER}/bin/activate"
# source "/home/data/code/me/venv3.10/bin/activate"
#
# RenderMan
#
export RMAN_VER_MAJOR=26
export RMAN_VER_MINOR=1
export RMAN_VER=${RMAN_VER_MAJOR}.${RMAN_VER_MINOR}
source ~/env/env_rman${RMAN_VER}.sh
export LD_LIBRARY_PATH=${RMANTREE}/lib:${LD_LIBRARY_PATH}
#
# USD
#
export USD="${usd_dir}/pixar/USD-v${USD_VER}_rman${RMAN_VER}_ABI_0_py${PY_VER}"
export USD_LOCATION=${USD}

export LD_LIBRARY_PATH=${USD}/lib64:${USD}/lib:${USD}/plugin/usd:${LD_LIBRARY_PATH}
export PATH=${USD}/bin:${PATH}
export PYTHONPATH=${USD}/lib/python:${USD}/lib/python${PY_VER}/site-packages:${PYTHONPATH}

usd_examples="${USD}/share/usd/examples/plugin"
export PXR_PLUGINPATH_NAME="${usd_examples}/usdObj/resources:${PXR_PLUGINPATH_NAME}"
# export PXR_PLUGINPATH_NAME="${usd_examples}/hdTiny/resources:${PXR_PLUGINPATH_NAME}"


# XXX Override HdPrman's defaults using the env var.  In the
# future we expect there may be more formal ways to represent
# per-app settings for particular Hydra plugins.
export HD_PRMAN_MAX_SAMPLES=512

# export USD_EDITOR="gedit"
export USD_EDITOR="usdmanager"
export OCIO="/home/mesh/Documents/OpenColorIO/aces_1.0.3/config.ocio"

echo "* Setup USD v${USD_VER}_ABI_0 working environment."
echo "* USD = ${USD_LOCATION}"
echo "* RMANTREE = ${RMANTREE}"
echo "* PIXAR_LICENSE_FILE = ${PIXAR_LICENSE_FILE}"
echo "* PXR_PLUGINPATH_NAME = ${PXR_PLUGINPATH_NAME}"
echo "* PATH = ${PATH}"
echo "* PYTHONPATH = ${PYTHONPATH}"
echo "* LD_LIBRARY_PATH = ${LD_LIBRARY_PATH}"
echo "* LD_PRELOAD = ${LD_PRELOAD}"
echo "* OCIO = ${OCIO}"



