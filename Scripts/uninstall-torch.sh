#!/bin/bash

echo
echo -------------------------------------------------
echo Removing Torch...
echo -------------------------------------------------
echo

sudo pip3 uninstall torch 
sudo pip3 uninstall torchvision

echo
echo -------------------------------------------------
echo Finished!
echo -------------------------------------------------
echo