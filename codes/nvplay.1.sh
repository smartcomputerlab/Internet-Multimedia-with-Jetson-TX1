gst-launch-1.0 filesrc location=test.h264 ! h264parse ! omxh264dec !  nvoverlaysink -e
