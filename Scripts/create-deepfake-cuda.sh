#!/bin/bash
cd ..

echo 
echo -------------------------------------------------
echo Creating deepfake... This may take some time!
echo -------------------------------------------------
echo 

sudo python3 generate-cuda.py

echo 
echo -------------------------------------------------
echo Finished!
echo -------------------------------------------------
echo 