gst-launch-1.0 -v \
    v4l2src device=/dev/video0 ! \
    video/x-raw, width=640, height=480, framerate=30/1 ! \
    videoconvert ! \
    x264enc bitrate=500 tune=zerolatency ! \
    rtph264pay config-interval=1 pt=96 ! \
    udpsink host=127.0.0.1 port=5000

