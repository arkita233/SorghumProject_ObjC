import cv2
import numpy as np
from matplotlib import pyplot as plt

imagePath = "/Users/baylerkelly/Desktop/Python/TestImage.jpeg"

img = cv2.imread(imagePath,0)
edges = cv2.Canny(img,30,100)

#plt.subplot(121),plt.imshow(img,cmap = 'gray')
#plt.title('Original Image'), plt.xticks([]), plt.yticks([])
plt.imshow(edges,cmap = 'gray')
plt.title('Edge Image'), plt.xticks([]), plt.yticks([])

plt.show()