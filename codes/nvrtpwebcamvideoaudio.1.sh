CLIENT_IP="192.168.43.117"
gst-launch-1.0 -v v4l2src device=/dev/video0 ! video/x-h264,width=1280,height=720,framerate=30/1 ! \
h264parse ! rtph264pay mtu=1400 ! udpsink host=$CLIENT_IP port=5000 sync=false async=false

