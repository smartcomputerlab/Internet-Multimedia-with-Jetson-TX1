source config.sh
gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-h264, width=1920, height=1080, framerate=30/1 ! rtph264pay ! .send_rtp_sink rtpsession name=session .send_rtp_src ! udpsink host=$CLIENT port=$PORT_RTP_VIDEO  session.send_rtcp_src ! udpsink host=$CLIENT port=$PORT_RTCP_VIDEO

