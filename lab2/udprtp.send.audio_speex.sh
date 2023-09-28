gst-launch-1.0 -v alsasrc device="default" ! audio/x-raw,rate=16000,channels=2 ! audioconvert ! speexenc ! queue ! rtpspeexpay ! udpsink host=192.168.1.72 port=8060

