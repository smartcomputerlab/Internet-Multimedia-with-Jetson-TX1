HOST=192.168.1.72
gst-launch-1.0 v4l2src device=/dev/video1 ! image/jpeg, width=320,height=240, framerate=10/1 ! queue ! jpegdec ! videoconvert ! xvimagesink \
ximagesrc ! video/x-raw,framerate=30/1 ! queue ! videoscale ! videoconvert ! openh264enc ! rtph264pay ! udpsink host=$HOST port=5005

