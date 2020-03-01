import cv2
import numpy as np
import matplotlib.pyplot as plt

imagePath = "/Users/baylerkelly/Desktop/Python/TestImage.jpeg"
guidePath = "/Users/baylerkelly/Desktop/Python/Guide.jpg"
rawImage = cv2.imread(imagePath)
adjImage = cv2.cvtColor(rawImage, cv2.COLOR_BGR2RGB)
rawImage = cv2.imread(guidePath)
adjGuide = cv2.cvtColor(rawImage, cv2.COLOR_BGR2RGB)

plt.imshow(adjImage)
plt.show()
