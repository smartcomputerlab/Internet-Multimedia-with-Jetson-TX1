gst-launch-1.0 -v \
    udpsrc port=5000 ! \
    application/x-rtp, payload=96 ! \
    rtph264depay ! \
    h264parse ! \
    avdec_h264 ! \
    videoconvert ! \
    autovideosink

