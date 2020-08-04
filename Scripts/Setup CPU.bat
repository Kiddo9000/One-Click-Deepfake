@echo off
title Deepfake Setup
cd ..

echo.
echo -------------------------------------------------
echo Installing dependencies via pip...
echo -------------------------------------------------
echo.

python -m pip install wheel
python -m pip install Cython
python -m pip install decorator
python -m pip install imageio
python -m pip install imageio-ffmpeg
python -m pip install numpy
python -m pip install tqdm
python -m pip install cffi
python -m pip install cloudpickle
python -m pip install cycler
python -m pip install dask
python -m pip install image
python -m pip install kiwisolver
python -m pip install matplotlib
python -m pip install moviepy
python -m pip install networkx
python -m pip install pandas
python -m pip install Pillow
python -m pip install pycparser
python -m pip install pygit
python -m pip install pyparsing
python -m pip install python-dateutil
python -m pip install pytz
python -m pip install PyWavelets
python -m pip install PyYAML
python -m pip install scikit-image
python -m pip install scikit-learn
python -m pip install scipy
python -m pip install six
python -m pip install toolz
python -m pip install torch==1.6.0+cpu torchvision==0.7.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

echo.
echo -------------------------------------------------
echo Finished! Press any key to exit...
echo -------------------------------------------------
echo.

pause>nul