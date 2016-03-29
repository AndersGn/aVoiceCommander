import cv2 as cv
import picamera
import picamera.array
import numpy as np

with picamera.PiCamera() as camera:
	with picamera.array.PiRGBArray(camera) as stream:
		camera.resolution = (320, 240)
		
		while True:
			camera.capture(stream, 'bgr', use_video_port=True)
			cv.imshow('frame', stream.array)
			data = np.fromstring(stream.getvalue(), dtype=np.uint8)
			img = cv.imdecode(data, 1)
			
			if cv.waitKey(1) & 0xFF == ord('q'):
				break
				
			stream.seek(0)
			stream.truncate()
			
cv.destroyAllWindows()