gst-launch-1.0 -v \
    videotestsrc is-live=true ! \
    video/x-raw, width=640, height=480, framerate=30/1 ! \
    x264enc bitrate=500 ! \
    rtph264pay config-interval=1 pt=96 ! \
    udpsink host=192.168.1.31 port=5000


