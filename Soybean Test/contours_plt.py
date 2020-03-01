import cv2
import numpy as np
import matplotlib.pyplot as plt

imagePath = "/Users/baylerkelly/Desktop/Python/TestImage.jpeg"
img = cv2.imread(imagePath)

image = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
gray = cv2.cvtColor(image, cv2.COLOR_RGB2GRAY)
_, binary = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)

contours, _ = cv2.findContours(binary, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)

print ("no of shapes {0}".format(len(contours)))

for cnt in contours:
    rect = cv2.minAreaRect(cnt)
    box = cv2.boxPoints(rect)
    box = np.int0(box)
    image = cv2.drawContours(img, [box], 0, (255,0,0), 5)

plt.figure("Example 1")
plt.imshow(image)
plt.title('Binary Contours in image')
plt.show()

