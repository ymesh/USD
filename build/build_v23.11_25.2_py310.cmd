@echo OFF

set USD_VER=23.11
set RMAN_VER=25.2
set PY_VER=310

call ..\..\venv%PY_VER%\Scripts\activate.bat

set PRMAN_LOCATION="C:/Program Files/Pixar/RenderManProServer-%RMAN_VER%"

set deploy_dir=D:/data/libs/Pixar/USD.v%USD_VER%_%RMAN_VER%_py%PY_VER%
set src_dir=D:/data/libs/Pixar/src
set build_dir=D:/data/libs/Pixar/build

echo * PRMAN_LOCATION = %PRMAN_LOCATION%

python ../build_scripts/build_usd.py --verbose --src %src_dir% --build %build_dir% --alembic --hdf5 --ptex --openvdb --opencolorio --openimageio --materialx --prman --prman-location %PRMAN_LOCATION% %deploy_dir%

deactivate