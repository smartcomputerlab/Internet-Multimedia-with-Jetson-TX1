gst-launch-1.0 udpsrc port=5005 ! jpegdec ! videoconvert ! ximagesink \
 udpsrc port=5006 ! mpegaudioparse ! mpg123audiodec ! audioconvert ! audioresample ! autoaudiosink


