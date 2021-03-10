# Python program for Detection of a  
# specific color(blue here) using OpenCV with Python 
import cv2
import argparse
import numpy as np
import socket
import struct



face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')


def face_tracking(frame):
    image_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(image_gray, 1.3, 7)
    if len(faces) > 0:
        return faces[0]
    else:
        return 0,0,0,0

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

kernel = np.ones((8 ,8), np.uint8)

# Webcamera no 0 is used to capture the frames
#  
cap = cv2.VideoCapture(0)
  
  
data = (float(0), float(0),float(0), float(0), float(0), float(0))
# This drives the program into an infinite loop. 
while(1):        
    # Captures the live stream frame-by-frame 
    _, frame = cap.read()     
    x, y, w, h = face_tracking(frame)

    print(x, ",",y)
    data = (float(x+w/2), float(y+h/2),float(0), float(0), float(0), float(0))
    packer = struct.Struct('f f f f f f')
    packed_data = packer.pack(*data)
    s.sendto(packed_data, ('127.0.0.1', 4124))
    cv2.imshow('frame',frame) 
  
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
  
# Destroys all of the HighGUI windows. 
cv2.destroyAllWindows() 
  
# release the captured frame 
cap.release() 

#close socket
s.close()