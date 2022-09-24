source config.sh
gst-launch-1.0 -v udpsrc port=$PORT_RTP_VIDEO caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! queue ! rtph264depay ! decodebin ! videoconvert ! ximagesink

