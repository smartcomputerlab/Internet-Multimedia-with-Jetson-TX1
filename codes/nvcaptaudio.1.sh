gst-launch-1.0 -v alsasrc device=hw:2 ! audio/x-raw,channels=2 ,rate=16000 ! audioconvert ! lamemp3enc ! filesink location='samples/output.mp3'
