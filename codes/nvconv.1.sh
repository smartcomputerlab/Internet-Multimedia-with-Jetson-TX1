gst-launch-1.0 filesrc location=test.h264 ! h264parse !qtmux ! filesink location=test.mp4 -e
