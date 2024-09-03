gst-launch-1.0 -v alsasrc device="default" ! audioconvert ! audioresample ! audio/x-raw,rate=16000,channels=2 ! opusenc bitrate=64000 ! rtpopuspay pt=97 ! udpsink host=192.168.1.31 port=5002

