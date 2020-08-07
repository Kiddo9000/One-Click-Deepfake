import os
import sys
import imageio
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from skimage.transform import resize
import warnings

warnings.filterwarnings("ignore")

if os.path.isfile('Deepfake Content/original-image.png') == False:
    print("Error: The file 'original-image.png' does not exist! Make sure the file is in the 'Deepfake Content' folder and is not a different image format!")
    sys.exit(0)

if os.path.isfile('Deepfake Content/original-video.mp4') == False:
    print("Error: The file 'original-video.mp4' does not exist! Make sure the file is in the 'Deepfake Content' folder and is not a different video format!")
    sys.exit(0)

source_image = imageio.imread('Deepfake Content/original-image.png')
driving_video = imageio.mimread('Deepfake Content/original-video.mp4')

print("Preparing the video for processing (This may take a few minutes depending on your video)")

#Resize image and video to 256x256
source_image = resize(source_image, (256, 256))[..., :3]
driving_video = [resize(frame, (256, 256))[..., :3] for frame in driving_video]

def display(source, driving, generated=None):
    fig = plt.figure(figsize=(8 + 4 * (generated is not None), 6))

    ims = []
    for i in range(len(driving)):
        cols = [source]
        cols.append(driving[i])
        if generated is not None:
            cols.append(generated[i])
        im = plt.imshow(np.concatenate(cols, axis=1), animated=True)
        plt.axis('off')
        ims.append([im])

    ani = animation.ArtistAnimation(fig, ims, interval=50, repeat_delay=1000)
    plt.close()
    return ani

print("Creating the model and checkpoints")

#Create Model
from demo import load_checkpoints
generator, kp_detector = load_checkpoints(config_path='config/vox-adv-256.yaml',
                            checkpoint_path='data/vox-adv-cpk.pth.tar')

print("Animating image...")

#Animate image
from demo import make_animation
from skimage import img_as_ubyte

predictions = make_animation(source_image, driving_video, generator, kp_detector, relative=True)

imageio.mimsave('Deepfake Content/temp.mp4', [img_as_ubyte(frame) for frame in predictions])

if os.path.isfile('Deepfake Content/original-video.mp4') == False:
    print('Error: Could not locate the original video file! Make sure you did not delete it!')

if os.path.isfile('Deepfake Content/temp.mp4') == False:
    print('Error: Could not locate the deepfake video output!')

# This sets the result video framerate to the same as the original to fix issues with the
# output being the wrong framerate.

origfile = 'Deepfake Content/original-video.mp4'
resfile = 'Deepfake Content/temp.mp4'
finishfile = 'Deepfake Content/temp2.mp4'

origvideo = imageio.get_reader(origfile,  'ffmpeg')
resvideo = imageio.get_reader(resfile,  'ffmpeg')

fps = origvideo.get_meta_data()['fps']

finishvideo = imageio.get_writer(finishfile, fps=fps)

print('Finalizing video file...')
for im in resvideo:
    finishvideo.append_data(im[:, :, :])
finishvideo.close()

# Add the audio from the original video to the finished one.

from moviepy.editor import *

vidaudiofile = VideoFileClip("Deepfake Content/original-video.mp4")
vidfile = VideoFileClip("Deepfake Content/temp2.mp4")
audiotrack = vidaudiofile.audio
finalvid = vidfile.set_audio(audiotrack)

finalvid.write_videofile("Deepfake Content/result.mp4", fps=fps)

print('Final video saved as "./Deepfake Content/result.mp4"')

print('Cleaning up...')
os.remove(resfile)
os.remove(finishfile)