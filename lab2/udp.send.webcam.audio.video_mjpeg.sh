gst-launch-1.0 -v v4l2src device="/dev/video1" ! 'video/x-raw,width=320,height=240,framerate=30/1' ! queue ! videoconvert ! jpegenc ! udpsink host=192.168.1.72 port=5005 \
 alsasrc device="default" ! 'audio/x-raw,rate=16000,width=16,channels=2' ! queue ! lamemp3enc ! udpsink host=192.168.1.72 port=5006


