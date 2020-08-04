#!/bin/bash

echo
echo -------------------------------------------------
echo Removing Python dependencies...
echo -------------------------------------------------
echo

sudo pip3 uninstall cffi -y
sudo pip3 uninstall cloudpickle -y
sudo pip3 uninstall cycler -y
sudo pip3 uninstall dask -y
sudo pip3 uninstall decorator -y
sudo pip3 uninstall image -y
sudo pip3 uninstall imageio -y
sudo pip3 uninstall imageio-ffmpeg -y
sudo pip3 uninstall kiwisolver -y
sudo pip3 uninstall matplotlib -y
sudo pip3 uninstall networkx -y
sudo pip3 uninstall numpy -y
sudo pip3 uninstall pandas -y
sudo pip3 uninstall Pillow -y
sudo pip3 uninstall pycparser -y
sudo pip3 uninstall pygit -y
sudo pip3 uninstall pyparsing -y
sudo pip3 uninstall python-dateutil -y
sudo pip3 uninstall pytz -y
sudo pip3 uninstall PyWavelets -y
sudo pip3 uninstall PyYAML -y
sudo pip3 uninstall scikit-image -y
sudo pip3 uninstall scikit-learn -y
sudo pip3 uninstall scipy -y
sudo pip3 uninstall six -y
sudo pip3 uninstall toolz -y
sudo pip3 uninstall torch  -y
sudo pip3 uninstall torchvision -y
sudo pip3 uninstall tqdm -y

echo
echo -------------------------------------------------
echo Finished!
echo -------------------------------------------------
echo