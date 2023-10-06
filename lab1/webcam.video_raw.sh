gst-launch-1.0 v4l2src device=/dev/video1 ! videoconvert ! videoscale ! video/x-raw, hight=480, width=640, format=RGB ! queue ! videoconvert ! ximagesink
