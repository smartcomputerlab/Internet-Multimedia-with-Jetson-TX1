source config.sh
gst-launch-1.0 udpsrc port=$PORT_RTP_VIDEO caps="application/x-rtp, media=(string)video,clock-rate=(int)90000, encoding-name=(string)H264, encoding-params=(string)1" ! .recv_rtp_sink rtpsession name=session .recv_rtp_src ! rtph264depay ! H264parse ! omxh264dec ! videoconvert ! xvimagesink udpsrc port=$PORT_RTCP_VIDEO caps="application/x-rtcp" ! session.recv_rtcp_sink

