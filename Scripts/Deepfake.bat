@echo off
title One Click Deepfake
color 0F
set defdir=%CD%

:MENU
cls
cd %defdir%
type logo.txt
echo.
echo.
echo Welcome! If you are new here, read the requirements first! (Option 2)
echo.
echo   1.  General Help                     (In case you forget something or need help.)
echo   2.  Requirements for install         (Read me first!)
echo.
echo   3.  Create Deepfake using CPU mode   (Create a Deepfake using CPU mode.)
echo   4.  Create Deepfake using CUDA mode  (Create a Deepfake using CUDA mode.)
echo.
echo   5.  Install everything               (Install all dependencies, tools, and Torch.)
echo   6.  Install dependencies             (Run this to install everything needed to make the Deepfake.)
echo   7.  Install Torch for CPU            (Works on all systems, but is slower.)
echo   8.  Install Torch for CUDA           (Faster, but only works with NVIDIA GPU's.)
echo.
echo   9.  Download the Model               (This is required. Only needs to be run once.)
echo.
echo   10. Uninstall Torch                  (Run this first before switching between CPU/CUDA.)
echo   11. Uninstall all dependencies       (This is not recommended if you use other python scripts!)
echo.
echo   12. Exit
echo.

set /p op=Select an option: 
if "%op%"=="1" goto GENERALHELP
if "%op%"=="2" goto INSTALLREQ
if "%op%"=="3" goto CREATECPU
if "%op%"=="4" goto CREATECUDA
if "%op%"=="5" goto INSTALLALL
if "%op%"=="6" goto INSTALLDEP
if "%op%"=="7" goto INSTALLCPU
if "%op%"=="8" goto INSTALLCUDA
if "%op%"=="9" goto DOWNLOADMODEL
if "%op%"=="10" goto UNINSTALLTOR
if "%op%"=="11" goto UNINSTALLALL
if "%op%"=="12" goto ENDOFFILE
goto :MENU

rem ------------ GENERAL HELP ------------

:GENERALHELP
cls
type help.txt
echo.
echo.
echo Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ INSTALLER REQUIREMENRS ------------

:INSTALLREQ
cls
type requirements.txt
echo.
echo.
echo Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ DEEPFAKE CPU ------------

:CREATECPU
cls
type logo.txt
echo.
echo.
echo Generating deepfake using CPU mode...
echo.
echo -----------------------------------------
echo.

cd ..
python generate.py

echo.
echo -----------------------------------------
echo.
echo Done! Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ DEEPFAKE CUDA ------------

:CREATECUDA
cls
type logo.txt
echo.
echo.
echo Generating deepfake using CUDA mode...
echo.
echo -----------------------------------------
echo.

cd ..
python generate-cuda.py

echo.
echo -----------------------------------------
echo.
echo Done! Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ INSTALL EVERYTHING ------------

:INSTALLALL
cls
type logo.txt
echo.
echo.
echo Installing all tools and dependencies...
echo.
echo -----------------------------------------
echo.

echo Preparing to install Python 3...

Ping www.google.com -n 1 -w 1000>nul
if errorlevel 1 (goto :PYTHONSKIP else (goto :PYTHONPROMPTINSTALL)

:PYTHONSKIP
echo.
echo ==== WARNING ====
echo It appears that you are offline right now. Python 3 setup requires an internet connection to install correctly. Skipping...
echo.
goto :INSTALLALL2

:PYTHONPROMPTINSTALL
echo Enter 1 and press enter to install Python 3. Python is required for deepfaking to work at all.
echo Press any other key and hit enter to skip.
set /p KRESP0=Choice: 
if "%KRESP0%" == "1" goto :PYTHONINSTALL
goto :INSTALLALL2

:PYTHONINSTALL
echo Installing Python 3...
cd ..
cd tools
start /wait python-3.8.5-amd64-webinstall.exe /quiet InstallAllUsers=1 TargetDir="C:\Python38" AssociateFiles=1 PrependPath=1 Shortcuts=0 Include_doc=0 Include_exe=1 InstallLauncherAllUsers=1
echo Python 3 has finished installing!
cd %defdir%

:INSTALLALL2
echo.
echo -----------------------------------------
echo.
echo Preparing to install Visual Studio C++ Build Tools...

Ping www.google.com -n 1 -w 1000>nul
if errorlevel 1 (goto :VSSKIP) else (goto :VSPROMPTINSTALL)

:VSSKIP
echo.
echo ==== WARNING ====
echo It appears that you are offline right now. Visual Studio Build Tools requires an internet connection to install correctly. Skipping...
echo.
goto :INSTALLALL3

:VSPROMPTINSTALL
echo Enter 1 and press enter to install Visual Studio C++ Build Tools. It is highly recommended to install it if you do not already have it installed.
echo Press any other key and hit enter to skip.
set /p KRESP1=Choice: 
if "%KRESP1%" == "1" goto :VSINSTALL
goto :INSTALLALL3

:VSINSTALL
echo Installing Visual Studio C++ Build Tools...
cd ..
cd tools
start /wait vs_buildtools.exe --quiet --layout C:\VSBuildTools19 --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --includeOptional --lang en-US
echo Visual Studio Build Tools has finished installing!
cd %defdir%

:INSTALLALL3
echo.
echo -----------------------------------------
echo.
echo Preparing pip...
python -m pip install --upgrade pip
echo.
echo -----------------------------------------
echo.
echo Setting up dependencies...
python -m pip install -r dependencies.txt --no-index

:TORCHPRMOPTINSTALL
echo.
echo -----------------------------------------
echo.
echo Enter 1 and press enter to install Torch for CPU. Enter 2 and press enter to install Torch for CUDA.
echo Press any other key and hit enter to install Torch for CPU.
set /p K2RESP=Choice: 
if "%K2RESP%" == "1" goto :TORCHCPUINSTALL
if "%K2RESP%" == "2" goto :TORCHCUDAINSTALL
goto :TORCHPRMOPTINSTALL

:TORCHCPUINSTALL
echo Installing Torch for CPU...
python -m pip install torch==1.6.0+cpu torchvision==0.7.0+cpu -f https://download.pytorch.org/whl/torch_stable.html
echo Finished installing Torch!
goto :INSTALLALL4

:TORCHCUDAINSTALL
echo Installing Torch for CUDA...
python -m pip install torch===1.6.0 torchvision===0.7.0 -f https://download.pytorch.org/whl/torch_stable.html
echo Finished installing Torch!

:INSTALLALL4
echo.
echo -----------------------------------------
echo.
echo Downloading Model...
cd ..
cd tools
wget "https://srv-file19.gofile.io/download/9jOV6A/vox-adv-cpk.pth.tar" -O "vox-adv-cpk.pth.tar"
title One Click Deepfake
xcopy "vox-adv-cpk.pth.tar" "../data" /Y
echo Cleaning up...
del "vox-adv-cpk.pth.tar" /q /f
cd %defdir%

echo.
echo -----------------------------------------
echo.
echo Done! Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ INSTALL DEPENDENCIES ------------

:INSTALLDEP
cls
type logo.txt
echo.
echo.
echo Installing all dependencies...
echo.
echo -----------------------------------------
echo.

python -m pip install -r dependencies.txt

echo.
echo -----------------------------------------
echo.
echo Done! Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ DOWNLOAD MODEL ------------

:DOWNLOADMODEL
cls
type logo.txt
echo.
echo.
echo Downloading Model...
echo.
echo -----------------------------------------
echo.

cd ..
cd tools
wget "https://srv-file19.gofile.io/download/9jOV6A/vox-adv-cpk.pth.tar" -O "vox-adv-cpk.pth.tar"
title One Click Deepfake
xcopy "vox-adv-cpk.pth.tar" "../data"
del "vox-adv-cpk.pth.tar" /q /f
cd %defdir%

echo.
echo -----------------------------------------
echo.
echo Done! Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ INSTALL CPU ------------

:INSTALLCPU
cls
type logo.txt
echo.
echo.
echo Installing Torch for CPU...
echo.
echo -----------------------------------------
echo.

python -m pip install torch==1.6.0+cpu torchvision==0.7.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

echo.
echo -----------------------------------------
echo.
echo Done! Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ INSTALL CUDA ------------

:INSTALLCUDA
cls
type logo.txt
echo.
echo.
echo Installing Torch for CUDA...
echo.
echo -----------------------------------------
echo.

python -m pip install torch===1.6.0 torchvision===0.7.0 -f https://download.pytorch.org/whl/torch_stable.html

echo.
echo -----------------------------------------
echo.
echo Done! Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ UNINSTALL TORCH ------------

:UNINSTALLTOR
cls
type logo.txt
echo.
echo.
echo Removing Torch...
echo.
echo -----------------------------------------
echo.

python -m pip uninstall torch torchvision -y

echo.
echo -----------------------------------------
echo.
echo Done! Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ UNINSTALL ALL DEPENDENCIES ------------

:UNINSTALLALL
cls
type logo.txt
echo.
echo.
echo Removing all dependencies...
echo.
echo -----------------------------------------
echo.

python -m pip unintsall -r dependencies.txt -y --no-index
python -m pip uninstall torch torchvision -y

echo.
echo -----------------------------------------
echo.
echo Done! Press any key to return to the menu.
pause>nul
goto :MENU

rem ------------ END OF FILE ------------

:ENDOFFILE
cls