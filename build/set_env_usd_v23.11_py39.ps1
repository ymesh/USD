$USD_VER = 23.11
$PY_VER = 39
$USD_DIR = "D:/data/libs/Pixar/USD.v$USD_VER" + "_py$PY_VER"

$env:PATH = "$USD_DIR/bin;$USD_DIR/lib;" + $env:PATH
$env:OCIO = "C:/Program Files/Autodesk/Maya2024/resources/OCIO-configs/Maya2022-default/config.ocio"

$PLRESOLVER = "D:/data/code/plarium/plresolver/out/plresolver_py$PY_VER"
$env:PYTHONPATH = "$USD_DIR/lib/python;$PLRESOLVER;" + $env:PYTHONPATH

$env:PXR_PLUGINPATH_NAME = $PLRESOLVER
$env:PXR_AR_DEFAULT_SEARCH_PATH = "D:/data/vpd"

Write-Host "* USD_DIR = $USD_DIR"
Write-Host "* PATH = $env:PATH"
Write-Host "* PYTHONPATH = $env:PYTHONPATH"
Write-Host "* OCIO = $env:OCIO"
Write-Host "* PXR_PLUGINPATH_NAME = $env:PXR_PLUGINPATH_NAME"
Write-Host "* PXR_AR_DEFAULT_SEARCH_PATH = $env:PXR_AR_DEFAULT_SEARCH_PATH"

$code_libs="D:\data\code\libs"
& "$code_libs\venv$PY_VER\Scripts\activate.ps1"
