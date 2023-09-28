gst-launch-1.0 udpsrc port=5005 ! h264parse ! queue ! openh264dec ! videoconvert ! ximagesink \
 udpsrc port=5006 !queue ! decodebin ! audioconvert ! audioresample ! autoaudiosink

