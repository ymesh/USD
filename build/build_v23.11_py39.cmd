@echo OFF
set USD_VER=23.11
set PY_VER=39
set deploy_dir=D:/data/libs/Pixar/USD.v%USD_VER%_py%PY_VER%
set src_dir=D:/data/libs/Pixar/src
set build_dir=D:/data/libs/Pixar/build

python ../USD/build_scripts/build_usd.py --build %build_dir% --verbose --alembic --hdf5 --ptex --openvdb --opencolorio --openimageio --materialx --force opencolorio --src %src_dir% %deploy_dir%