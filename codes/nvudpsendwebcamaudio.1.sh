gst-launch-1.0 -v alsasrc device=hw:2 ! 'audio/x-raw, rate=16000, width=16, channels=2' ! audioconvert ! lamemp3enc ! udpsink host=192.168.1.149 port=5001

