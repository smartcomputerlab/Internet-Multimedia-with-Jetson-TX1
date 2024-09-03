gst-launch-1.0 -v  v4l2src device=/dev/video1 ! video/x-h264, framerate=30/1 ! h264parse ! rtph264pay config-interval=1 pt=96 ! udpsink host=192.168.1.31 port=5000  alsasrc device="default" ! audioconvert ! audioresample ! audio/x-raw,rate=16000,channels=2 ! opusenc bitrate=64000 ! rtpopuspay pt=97 ! udpsink host=192.168.1.31 port=5002

