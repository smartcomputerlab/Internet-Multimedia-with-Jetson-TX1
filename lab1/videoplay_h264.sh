gst-launch-1.0 filesrc location=../samples/test.h264 ! h264parse ! avdec_h264 !  videoconvert ! xvimagesink -e

