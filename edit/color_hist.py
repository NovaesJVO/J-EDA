import numpy as np
import argparse
import cv2
import os

a_list = os.listdir("./Corel1000")

arq = open("Corel_Colorhist.txt","w+")

arq.truncate()

features = []

arq.write(str(len(a_list))+"\n")
arq.write("128\n")
for x in a_list:

    image = cv2.imread("./Corel1000/"+x)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    hist = cv2.calcHist([gray], [0], None, [128], [0, 255])
    
    for y in hist:
        arq.write(str(int(y))+";")
    
    arq.write(x+"\n")
    
arq.close()
