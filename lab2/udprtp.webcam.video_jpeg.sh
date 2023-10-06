CLIENT_IP="192.168.1.62"
gst-launch-1.0 -v v4l2src device=/dev/video1 ! image/jpeg,width=640,height=480,framerate=30/1 ! \
rtpjpegpay mtu=1400 ! udpsink host=$CLIENT_IP port=8050 sync=false async=false

