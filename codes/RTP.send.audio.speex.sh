source config.sh
gst-launch-1.0 -v alsasrc device=hw:2 ! audio/x-raw,rate=16000,channels=2 ! audioconvert ! speexenc ! queue ! rtpspeexpay ! udpsink host=$CLIENT port=$PORT_RTP_AUDIO

