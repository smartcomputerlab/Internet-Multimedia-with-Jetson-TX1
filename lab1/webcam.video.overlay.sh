gst-launch-1.0 v4l2src device=/dev/video1 ! video/x-raw! videoconvert ! videoscale ! video/x-raw, hight=480, width=640, format=RGB ! queue ! gdkpixbufoverlay location=../samples/smartcomputerlab.jpg offset-x=20 offset-y=20 !  videoconvert ! xvimagesink

