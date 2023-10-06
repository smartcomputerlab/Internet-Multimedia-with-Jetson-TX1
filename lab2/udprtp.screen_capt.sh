gst-launch-1.0 -v ximagesrc ! video/x-raw,framerate=20/1 ! videoscale ! videoconvert ! openh264enc ! rtph264pay ! udpsink host=192.168.1.27  port=8050
