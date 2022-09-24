source config.sh
gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-h264, width=1920, height=1080, framerate=30/1 ! udpsink host=$CLIENT port=$PORT_UDPTCP_VIDEO

