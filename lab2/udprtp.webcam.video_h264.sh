CLIENT_IP="192.168.1.27"
gst-launch-1.0 -v v4l2src device=/dev/video1 ! video/x-h264,width=1920,height=1080,framerate=30/1 ! \
h264parse ! rtph264pay mtu=1400 ! udpsink host=$CLIENT_IP port=8050 sync=false async=false

