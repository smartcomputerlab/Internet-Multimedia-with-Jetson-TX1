source config.sh
gst-launch-1.0 udpsrc port=$PORT_RTP_VIDEO caps="application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, encoding-params=(string)1" ! queue ! rtph264depay ! h264parse ! omxh264dec ! Queue ! videoconvert ! xvimagesink


