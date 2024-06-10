#
# Setup USD working environment
#
USD_VER="24.05"
RMAN_VER="26.1"
PY_VER="3.12"
ARCH="x86_64"
PRMAN_LOCATION="/Applications/Pixar/RenderManProServer-${RMAN_VER}"

source /Users/mesh/data/code/me/venv${PY_VER}_x86/bin/activate
#
# USD
#
usd_dir="/Users/mesh/data/tools/USD/Pixar"
export USD="${usd_dir}/USD_v${USD_VER}_${RMAN_VER}_py${PY_VER}_${ARCH}"
export USD_LOCATION=${USD}

# The following in your PYTHONPATH environment variable:
# /Users/mesh/data/tools/USD/Pixar/USD_v24.05_26.1_py3.12_x86_64/lib/python

# The following in your PATH environment variable:
# /Users/mesh/data/tools/USD/Pixar/USD_v24.05_26.1_py3.12_x86_64/bin

export DYLD_LIBRARY_PATH=${USD}/lib:${USD}/plugin/usd:${DYLD_LIBRARY_PATH}
export PATH=${USD}/bin:${PATH}
export PYTHONPATH=${USD}/lib/python:${USD}/lib/python${PY_VER}/site-packages:${PYTHONPATH}

# usd_examples="${USD}/share/usd/examples/plugin"
# export PXR_PLUGINPATH_NAME="${usd_examples}/usdObj/resources:${PXR_PLUGINPATH_NAME}"
# export PXR_PLUGINPATH_NAME="${usd_examples}/hdTiny/resources:${PXR_PLUGINPATH_NAME}"


# XXX Override HdPrman's defaults using the env var.  In the
# future we expect there may be more formal ways to represent
# per-app settings for particular Hydra plugins.
export HD_PRMAN_MAX_SAMPLES=512

# export USD_EDITOR="gedit"
# export USD_EDITOR="usdmanager"
export OCIO="${PRMAN_LOCATION}/lib/ocio/ACES-1.2/config.ocio"

echo "* Setup USD v${USD_VER} working environment."
echo "* USD = ${USD_LOCATION}"
echo "* RMANTREE = ${RMANTREE}"
echo "* PXR_PLUGINPATH_NAME = ${PXR_PLUGINPATH_NAME}"
echo "* PATH = ${PATH}"
echo "* PYTHONPATH = ${PYTHONPATH}"
echo "* LD_LIBRARY_PATH = ${LD_LIBRARY_PATH}"
echo "* LD_PRELOAD = ${LD_PRELOAD}"
echo "* OCIO = ${OCIO}"



