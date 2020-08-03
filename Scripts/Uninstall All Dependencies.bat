@echo off
title Deepfake Configurator

echo.
echo -------------------------------------------------
echo Removing Python dependencies...
echo -------------------------------------------------
echo.

python -m pip uninstall cffi
python -m pip uninstall cloudpickle
python -m pip uninstall cycler
python -m pip uninstall dask
python -m pip uninstall decorator
python -m pip uninstall image
python -m pip uninstall imageio
python -m pip uninstall imageio-ffmpeg
python -m pip uninstall kiwisolver
python -m pip uninstall matplotlib
python -m pip uninstall networkx
python -m pip uninstall numpy
python -m pip uninstall pandas
python -m pip uninstall Pillow
python -m pip uninstall pycparser
python -m pip uninstall pygit
python -m pip uninstall pyparsing
python -m pip uninstall python-dateutil
python -m pip uninstall pytz
python -m pip uninstall PyWavelets
python -m pip uninstall PyYAML
python -m pip uninstall scikit-image
python -m pip uninstall scikit-learn
python -m pip uninstall scipy
python -m pip uninstall six
python -m pip uninstall toolz
python -m pip uninstall torch 
python -m pip uninstall torchvision
python -m pip uninstall tqdm
python -m pip uninstall wheel

echo.
echo -------------------------------------------------
echo Finished! Press any key to exit...
echo -------------------------------------------------
echo.

pause>nul