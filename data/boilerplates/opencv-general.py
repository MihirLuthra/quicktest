import cv2
import numpy as np
import os
import sys
import math

__img = {}

def show(img):
    if img is not None:
        cv2.imshow("Test Window", img)
        cv2.waitKey(0) & 0xFF
    else:
        print("show(): img is empty")

def img(idx):
    if len(sys.argv) > idx + 1:
        img_path = sys.argv[idx + 1]
        if __img.get(str(idx)) is None:
            __img[str(idx)] = cv2.imread(img_path)
        return __img[str(idx)]

image = img(0)

show(image)
