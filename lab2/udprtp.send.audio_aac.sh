gst-launch-1.0 -v alsasrc device="default" ! audio/x-raw,rate=16000,channels=2 ! audioconvert ! audioresample ! avenc_ac3 ! rtpac3pay  ! udpsink host=192.168.1.62 port=8060

