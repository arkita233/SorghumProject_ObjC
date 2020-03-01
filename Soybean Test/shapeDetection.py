import cv2
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

imagePath = "/Users/baylerkelly/Desktop/Python/TestImage.png"
img = mpimg.imread('/Users/baylerkelly/Desktop/Python/TestImage.png')

def rgb2gray(rgb):
    return np.dot(rgb[...,:3], [0.2989, 0.5870, 0.1140])
   
gray = rgb2gray(img)   



plt.imshow(gray, cmap=plt.get_cmap('gray'), vmin=0, vmax=1)
plt.show()
