gst-launch-1.0 udpsrc port=8050 caps="application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)JPEG, encoding-params=(string)1" ! \
rtpjpegdepay ! jpegdec ! queue ! videoconvert ! xvimagesink

