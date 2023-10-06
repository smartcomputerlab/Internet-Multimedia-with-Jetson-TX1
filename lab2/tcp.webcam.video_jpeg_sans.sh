source config.sh
gst-launch-1.0 v4l2src device=/dev/video1 ! image/jpeg, width=640, height=480, framerate=10/1 ! gdppay ! tcpserversink host=192.168.1.52 port=9009 sync=false

