# One Click Deepfake
The easy way to create a quick deepfake.

The main goal of this is to make using the First Order Motion Model to create a basic deepfake much easier.
Pretty much everything is written in Python and can be easily modified if you wish.

## How to use
Using One Click Deepfake is very easy!

1. Download the source code either via Git or through your browser.  
`git clone https://github.com/Kiddo9000/One-Click-Deepfake.git`

2. Extract everything to a folder somewhere.  
   It really doesn't really matter where. However, you may see a performance increase by using it on an SSD instead of a  
   mechanical drive.

3. Download and install python.  
   (Windows only, skip this if you are using linux.)  
   You can download Python 3 on their website, here: https://www.python.org/downloads/  
   Download the latest version for windows and install it using the default settings.  
   (You may need to restart for it to work correctly. If you have any issues running the scripts, then try restarting your pc.)

4. Go into the 'Scripts' folder and run the correct setup script.  
   If you are on windows, then run the .bat files.  
   If you are on linux, then run the .sh files.  
      
   At the end of each script file's name, it will say either CUDA or CPU. Make sure to run the setup correct for your system. If you do not have a Nvidia GPU, then you need to use the CPU installer. If you do have a Nvidia GPU, then you can use either, but CUDA is highly reccomended when avaliable.  
      
   If you run the wrong installer or want to use the other mode later on down the line, then do not worry! Simply run the "Uninstall Torch" script for your system (win/linux) as Torch is the only thing that is hardware specific. After that you can run the setup for the hardware mode you wish to use.  
      
   If you want to completly remove any installed dependencies, then run the "Uninstall All Dependencies" script instead. It is worth noting that the linux setup will install python3 if it is not yet installed, however, it will not remove it if you run the uninstaller.
   
5. Prepare the deepfake's files.  
   (If you ever forget what to do with the files, these instructions are also included in the README.txt file in the "Deepfake Content" folder.)  
   Navigate into the folder called "Deepfake Content". In here is where you store your original image, video and the output.
   Move the image and the video you want to use into here. The image must be a png file and it needs to be named "original-image.png". Same goes with the video. It must be a mp4 file called "original-video.mp4".
   
6. Generate the deepfake.
   At this point if you have done everything correctly, you are ready to generate your deepfake! Go into the "Scripts" folder once more and this time, run the "Create Deepfake (CUDA/CPU)". Again, make sure you are using the one for your OS (.bat for windows, .sh for linux) and that you are using the correct one for your hardware and the one you used when running the setup script earlier. The entire process is automated. The program will tell you when it's done generating the deepfake. You can find the finished video in the "Deepfake Content" folder as "result.mp4"  
   
## Third Party Code/Credits
This project would have not been possible without the awesome people who made the First Order Motion Model library possible! (And chose to make it open source, too!)  
This project also relies on code from the awesome people who made the dependencies that this uses.  

First Order Motion Model - Aliaksandr Siaorhin - https://github.com/AliaksandrSiarohin/first-order-model  
CFFI - Armin Rigo, Maciej Fijalkowski - https://cffi.readthedocs.io/en/latest/  
Cloudpickle - Cloudpipe - https://github.com/cloudpipe/cloudpickle  
