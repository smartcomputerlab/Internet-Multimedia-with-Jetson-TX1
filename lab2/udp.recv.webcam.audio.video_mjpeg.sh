gst-launch-1.0 udpsrc port=5005 ! jpegdec ! videoconvert ! ximagesink \
 udpsrc port=5006 ! decodebin ! audioconvert ! audioresample ! autoaudiosink

