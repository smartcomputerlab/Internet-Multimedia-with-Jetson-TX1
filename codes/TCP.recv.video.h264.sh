source config.sh
gst-launch-1.0 tcpclientsrc host=$CLIENT port=$PORT_UDPTCP_VIDEO ! h264parse ! queue !omxh264dec ! videoconvert ! xvimagesink

