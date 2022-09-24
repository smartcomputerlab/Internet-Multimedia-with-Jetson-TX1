gst-launch-1.0 -v v4l2src device=/dev/video1 ! video/x-h264,width=1280,height=720,framerate=30/1 ! \
 h264parse !  matroskamux ! filesink location='output.mkv'
#gst-launch-1.0 -v v4l2src device=/dev/video1 ! video/x-h264,width=1280,height=720,framerate=30/1 ! h264parse !  omxh264dec ! nveglglessink -e

