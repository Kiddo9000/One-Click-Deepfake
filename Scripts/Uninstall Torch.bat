@echo off
title Deepfake Configurator

echo.
echo -------------------------------------------------
echo Removing Torch...
echo -------------------------------------------------
echo.

python -m pip uninstall torch 
python -m pip uninstall torchvision

echo.
echo -------------------------------------------------
echo Finished! Press any key to exit...
echo -------------------------------------------------
echo.

pause>nul