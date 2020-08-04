@echo off
title Deepfake Configurator

echo.
echo -------------------------------------------------
echo Removing Torch...
echo -------------------------------------------------
echo.

python -m pip uninstall torch -y
python -m pip uninstall torchvision -y

echo.
echo -------------------------------------------------
echo Finished! Press any key to exit...
echo -------------------------------------------------
echo.

pause>nul