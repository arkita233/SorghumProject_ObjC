import cv2
import numpy as np
import matplotlib.pyplot as plt

imagePath = "/Users/baylerkelly/Desktop/Python/TestImage.jpeg"
img = cv2.imread(imagePath)

image = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
gray_image = cv2.cvtColor(image, cv2.COLOR_RGB2GRAY)

cv2.imshow(gray_image)
cv2.show()