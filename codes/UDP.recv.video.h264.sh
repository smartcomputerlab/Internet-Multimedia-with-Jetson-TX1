source config.sh
gst-launch-1.0 udpsrc port=$PORT_UDPTCP_VIDEO ! queue !h264parse ! omxh264dec ! Videoconvert ! xvimagesink

