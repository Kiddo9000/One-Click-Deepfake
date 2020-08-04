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
python -m pip install cffi
python -m pip install cloudpickle
python -m pip install cycler==0.10.0
python -m pip install dask==0.18.2
python -m pip install decorator==4.3.0
python -m pip install image
python -m pip install imageio==2.3.0
python -m pip install imageio-ffmpeg
python -m pip install kiwisolver==1.0.1
python -m pip install matplotlib
python -m pip install moviepy
python -m pip install networkx==2.1
python -m pip install numpy
python -m pip install pandas
python -m pip install Pillow
python -m pip install pycparser==2.18
python -m pip install pygit==0.1
python -m pip install pyparsing==2.2.0
python -m pip install python-dateutil==2.7.3
python -m pip install pytz==2018.5
python -m pip install PyWavelets
python -m pip install PyYAML==5.1
python -m pip install scikit-image
python -m pip install scikit-learn
python -m pip install scipy
python -m pip install six==1.11.0
python -m pip install toolz
python -m pip install torch===1.6.0 torchvision===0.7.0 -f https://download.pytorch.org/whl/torch_stable.html
python -m pip install tqdm==4.24.0

echo.
echo -------------------------------------------------
echo Finished! Press any key to exit...
echo -------------------------------------------------
echo.

pause>nul