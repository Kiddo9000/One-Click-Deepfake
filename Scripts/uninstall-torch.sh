#!/bin/bash

echo
echo -------------------------------------------------
echo Removing Torch...
echo -------------------------------------------------
echo

sudo pip3 uninstall torch -y
sudo pip3 uninstall torchvision -y

echo
echo -------------------------------------------------
echo Finished!
echo -------------------------------------------------
echo