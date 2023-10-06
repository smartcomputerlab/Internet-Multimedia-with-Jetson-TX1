CLIENT_IP="192.168.1.27"
gst-launch-1.0 -v v4l2src device=/dev/video1 ! video/x-raw,width=640,height=480,framerate=20/1 ! \
videobalance saturation=0  ! openh264enc ! rtph264pay mtu=1400 ! udpsink host=$CLIENT_IP port=8050 sync=false async=false

