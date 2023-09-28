gst-launch-1.0 -v alsasrc device="default" ! 'audio/x-raw, rate=16000, width=16, channels=2' ! audioconvert ! lamemp3enc ! udpsink host=192.168.1.72 port=5001

