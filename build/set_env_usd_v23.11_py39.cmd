@echo OFF
set USD_VER=23.11
set PY_VER=39
set USD_DIR=D:/data/libs/Pixar/USD.v%USD_VER%_py%PY_VER%
set PATH=%USD_DIR%\bin;%USD_DIR%\lib;%PATH%
set OCIO=C:/Program Files/Autodesk/Maya2024/resources/OCIO-configs/Maya2022-default/config.ocio

set PLRESOLVER=D:/data/code/plarium/plresolver/out/plresolver_py%PY_VER%
set PYTHONPATH=%USD_DIR%/lib/python;%PLRESOLVER%;%PYTHONPATH%

set PXR_PLUGINPATH_NAME=%PLRESOLVER%
set PXR_AR_DEFAULT_SEARCH_PATH=D:/data/vpd

echo * PATH = %PATH%
echo * PYTHONPATH = %PYTHONPATH%
echo * OCIO = %OCIO%
echo * PXR_PLUGINPATH_NAME = %PXR_PLUGINPATH_NAME%
echo * PXR_AR_DEFAULT_SEARCH_PATH = %PXR_AR_DEFAULT_SEARCH_PATH%

set code_libs=D:\data\code\libs
%code_libs%\venv%PY_VER%\Scripts\activate.bat
