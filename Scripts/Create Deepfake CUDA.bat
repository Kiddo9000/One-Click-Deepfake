@echo off
title Deepfake Creator
cd ..

echo.
echo -------------------------------------------------
echo Creating deepfake... This may take some time!
echo -------------------------------------------------
echo.

python generate-cuda.py

echo.
echo -------------------------------------------------
echo Finished! Press any key to exit...
echo -------------------------------------------------
echo.

pause>nul