gst-launch-1.0 -v v4l2src device=/dev/video1 ! queue ! video/x-h264,width=1280,height=720,framerate=30/1 ! h264parse ! queue ! avdec_h264 ! videoconvert ! autovideosink -e \
	alsasrc device="default" ! audio/x-raw,channels=2,rate=16000 ! audioconvert ! queue ! alsasink -e
