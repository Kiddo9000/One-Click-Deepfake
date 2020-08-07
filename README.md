# One Click Deepfake
The easy way to create a quick deepfake.

The main goal of this is to make using the First Order Motion Model to create a basic deepfake much easier.
Pretty much everything is written in Python and can be easily modified if you wish.

This works for both Windows and Linux with about the same level of complexity.

## How to use (Windows)
Using One Click Deepfake is very easy! The instructions below will guide you on how to use OCD for Windows. The Linux instructions are further down.

### 1. Download the source code
   You can either use git or your browser.  
   `git clone https://github.com/Kiddo9000/One-Click-Deepfake.git`  
   If you download using your browser, remember to unzip it!

### 2. Install the deepfake tools
   Run the "Deepfake.bat" file located in the "Scripts" folder. You will be presented with a menu with several options.
   For most people, the "Install Everything" option will work just fine. This will install Python 3 (if it is not detected), Visual Studio C++ Build Tools (Required for some of the Python dependencies), all the dependencies, and download the deepfake model.
   If you want to install Python and the C++ Build Tools manually, then you can run the setup programs located in the "tools" folder.

### 3. Prepare the deepfake files
   Copy your video and image to the "Deepfake Content" folder. The video MUST be a mp4 file and the image MUST be a png file. Name the image "original-image.png" and the video "original-video.mp4".  

### 4. Create the deepfake
   Run the "Deepfake.bat" file once more. This time, run either option 3 (Create deepfake using CPU) or option 4 (Create deepfake using CUDA) depending on your hardware and the install option you used. The process of creating the deepfake is automated, just like the setup. Once complete, the resulting video will be placed in "Deepfake Content" as "result.mp4".

## How to use (Linux)
This is the same as above but for the Linux version as it differs from the Windows version.

### 1. Download the soruce code
   You can either use git or your browser.  
   `git clone https://github.com/Kiddo9000/One-Click-Deepfake.git`  
   If you download using your browser, remember to unzip it!

### 2. Install the deepfake tools
   Open a terminal window in the "Scripts" folder. If you have an NVIDIA GPU then you can use the CUDA mode. Otherwise, you will have to use CPU mode. To install, run "./Deepfake.sh --install-cpu" for CPU. "./Deepfake.sh --install-cuda" for CUDA.

### 3. Prepare the deepfake files
   Copy your video and image to the "Deepfake Content" folder. The video MUST be a mp4 file and the image MUST be a png file. Name the image "original-image.png" and the video "original-video.mp4".  

### 4. Create the deepfake
   Run "./Deepfake.sh --create-cpu" to create a deepfake using CPU mode. "./Deepfake.sh --create-cuda" will use CUDA if avaliable. The process of creating the deepfake is automated, just like the setup. Once complete, the resulting video will be placed in "Deepfake Content" as "result.mp4".

## Third Party Code/Credits
This project would have not been possible without the awesome people who made the First Order Motion Model library possible! (And chose to make it open source, too!)  
This project also relies on code from the awesome people who made the dependencies that this uses.  

First Order Motion Model - Aliaksandr Siaorhin - <https://github.com/AliaksandrSiarohin/first-order-model>  
CFFI - Armin Rigo, Maciej Fijalkowski - <https://cffi.readthedocs.io/en/latest>  
Cloudpickle - Cloudpipe - <https://github.com/cloudpipe/cloudpickle>  
Cycler - Thomas A Caswell - <http://github.com/matplotlib/cycler>  
Dask - Matthew Rocklin - <https://github.com/dask/dask>  
Decorator - Michele Simionato - <https://github.com/micheles/decorator>  
Image - Francesc Ortiz - <https://github.com/francescortiz/image>  
ImageIO - ImageIO Contributors - <https://github.com/imageio/imageio>  
ImageIO-FFMPEG - ImageIO Contributors - <https://github.com/imageio/imageio-ffmpeg>  
Kiwisolver - The Nucleic Development Team - <https://github.com/nucleic/kiwi>  
Matplotlib - John D. Hunter, Michael Droettboom - <https://matplotlib.org>  
Moviepy - Zulko 2017 - <https://zulko.github.io/moviepy>  
Networkx - Aric Hagberg - <http://networkx.github.io>  
NumPy - NumPy Developers - <https://www.numpy.org>  
Pandas - The PyData Development Team - <https://pandas.pydata.org>  
Pillow - Alex Clark - <https://python-pillow.org>  
Pycparser - Eli Bendersky - <https://github.com/eliben/pycparser>  
Pygit - Steve Fracinaux - <http://code.istique.net>  
Pyparsing - Paul McGuire - <https://github.com/pyparsing/pyparsing>  
Python-Dateutil - Gustavo Niemeyer - <https://dateutil.readthedocs.io>  
Pytz - Stuart Bishop - <http://pythonhosted.org/pytz>  
PyWavelets - The PyWavelets Developers - <https://github.com/PyWavelets/pywt>  
PyYAML - Kirill Simonov - <https://github.com/yaml/pyyaml>  
Scikit-Image - Stefan van der Walt - <https://scikit-image.org>  
Scikit-Learn - Andreas Mueller - <http://scikit-learn.org>  
Scipy - SciPy Developers - <https://www.scipy.org>  
Six - Denjamin Peterson - <https://github.com/benjaminp/six>  
Toolz - Matthew Rocklin - <https://github.com/pytoolz/toolz>  
Torch - PyTorch Team - <https://pytorch.org>  
Torchvision - PyTorch Core Team - <https://github.com/pytorch/vision>  
TQDM - TQDM Developers - <https://github.com/tqdm/tqdm>  
  
This project could have not been possible without Python as well! <https://python.org/>  
And the Windows version could have not been possible without the Microsoft C++ Build Tools! <https://visualstudio.microsoft.com/>
