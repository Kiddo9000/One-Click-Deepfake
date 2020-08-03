#!/bin/bash
cd ..

echo 
echo -------------------------------------------------
echo Installing Python3...
echo -------------------------------------------------
echo 

sudo apt-get update
sudo apt-get -y install python3
sudo apt-get -y install python3-pip

echo 
echo -------------------------------------------------
echo Installing dependencies via pip...
echo -------------------------------------------------
echo 

sudo pip3 install cffi
sudo pip3 install cloudpickle
sudo pip3 install cycler==0.10.0
sudo pip3 install dask==0.18.2
sudo pip3 install decorator==4.3.0
sudo pip3 install image
sudo pip3 install imageio==2.3.0
sudo pip3 install imageio-ffmpeg
sudo pip3 install kiwisolver==1.0.1
sudo pip3 install matplotlib
sudo pip3 install moviepy
sudo pip3 install networkx==2.1
sudo pip3 install numpy
sudo pip3 install pandas==0.23.4
sudo pip3 install Pillow
sudo pip3 install pycparser==2.18
sudo pip3 install pygit==0.1
sudo pip3 install pyparsing==2.2.0
sudo pip3 install python-dateutil==2.7.3
sudo pip3 install pytz==2018.5
sudo pip3 install PyWavelets
sudo pip3 install PyYAML==5.1
sudo pip3 install scikit-image
sudo pip3 install scikit-learn
sudo pip3 install scipy
sudo pip3 install six==1.11.0
sudo pip3 install toolz
sudo pip3 install torch==1.6.0+cpu torchvision==0.7.0+cpu -f https://download.pytorch.org/whl/torch_stable.html
sudo pip3 install tqdm==4.24.0
sudo pip3 install wheel

echo 
echo -------------------------------------------------
echo Finished!
echo -------------------------------------------------
echo 