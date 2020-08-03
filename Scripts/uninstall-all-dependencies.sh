#!/bin/bash

echo
echo -------------------------------------------------
echo Removing Python dependencies...
echo -------------------------------------------------
echo

sudo pip3 uninstall cffi
sudo pip3 uninstall cloudpickle
sudo pip3 uninstall cycler
sudo pip3 uninstall dask
sudo pip3 uninstall decorator
sudo pip3 uninstall image
sudo pip3 uninstall imageio
sudo pip3 uninstall imageio-ffmpeg
sudo pip3 uninstall kiwisolver
sudo pip3 uninstall matplotlib
sudo pip3 uninstall networkx
sudo pip3 uninstall numpy
sudo pip3 uninstall pandas
sudo pip3 uninstall Pillow
sudo pip3 uninstall pycparser
sudo pip3 uninstall pygit
sudo pip3 uninstall pyparsing
sudo pip3 uninstall python-dateutil
sudo pip3 uninstall pytz
sudo pip3 uninstall PyWavelets
sudo pip3 uninstall PyYAML
sudo pip3 uninstall scikit-image
sudo pip3 uninstall scikit-learn
sudo pip3 uninstall scipy
sudo pip3 uninstall six
sudo pip3 uninstall toolz
sudo pip3 uninstall torch 
sudo pip3 uninstall torchvision
sudo pip3 uninstall tqdm
sudo pip3 uninstall wheel

echo
echo -------------------------------------------------
echo Finished!
echo -------------------------------------------------
echo