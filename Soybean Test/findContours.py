import cv2
import numpy as np

guidePath = "/Users/baylerkelly/Desktop/Python/Guide.jpg"
image = cv2.imread(guidePath)

gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

edged = cv2.Canny(gray, 30, 200)

contours, hierarchy = cv2.findContours(edged, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)

cv2.imshow('Canny Edges After Contouring', edged)

#print("Number of Contours found = " + str(len(contours)))

