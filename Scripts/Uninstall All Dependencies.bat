@echo off
title Deepfake Configurator

echo.
echo -------------------------------------------------
echo Removing Python dependencies...
echo -------------------------------------------------
echo.

python -m pip uninstall cffi -y
python -m pip uninstall cloudpickle -y
python -m pip uninstall cycler -y
python -m pip uninstall dask -y
python -m pip uninstall decorator -y
python -m pip uninstall image -y
python -m pip uninstall imageio -y
python -m pip uninstall imageio-ffmpeg -y
python -m pip uninstall kiwisolver -y
python -m pip uninstall matplotlib -y
python -m pip uninstall networkx -y
python -m pip uninstall numpy -y
python -m pip uninstall pandas -y
python -m pip uninstall Pillow -y
python -m pip uninstall pycparser -y
python -m pip uninstall pygit -y
python -m pip uninstall pyparsing -y
python -m pip uninstall python-dateutil -y
python -m pip uninstall pytz -y
python -m pip uninstall PyWavelets -y
python -m pip uninstall PyYAML -y
python -m pip uninstall scikit-image -y
python -m pip uninstall scikit-learn -y
python -m pip uninstall scipy -y
python -m pip uninstall six -y
python -m pip uninstall toolz -y
python -m pip uninstall torch  -y
python -m pip uninstall torchvision -y
python -m pip uninstall tqdm -y

echo.
echo -------------------------------------------------
echo Finished! Press any key to exit...
echo -------------------------------------------------
echo.

pause>nul