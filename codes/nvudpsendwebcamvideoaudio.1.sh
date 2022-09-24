gst-launch-1.0 -v v4l2src device="/dev/video0" ! 'video/x-raw,width=320,height=240,framerate=30/1' ! queue ! videoconvert ! jpegenc ! udpsink host=192.168.43.159 port=5005 \
 alsasrc device=hw:2 ! 'audio/x-raw,rate=16000,width=16,channels=2' ! queue ! lamemp3enc ! udpsink host=192.168.43.159 port=5006


