@echo OFF

set USD_VER=23.11
set PY_VER=310

call ..\..\venv%PY_VER%\Scripts\activate.bat

set deploy_dir=D:/data/libs/Pixar/USD.v%USD_VER%_py%PY_VER%
set src_dir=D:/data/libs/Pixar/src
set build_dir=D:/data/libs/Pixar/build

python ../build_scripts/build_usd.py --verbose --src %src_dir% --build %build_dir% --alembic --hdf5 --ptex --openvdb --opencolorio --openimageio --materialx %deploy_dir%

deactivate