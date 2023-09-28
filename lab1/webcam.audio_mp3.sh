gst-launch-1.0 -v alsasrc device="default" num-buffers=1000 ! audio/x-raw,channels=2 ,rate=16000 ! audioconvert ! lamemp3enc ! filesink location='../samples/webcam.output_mp3.mp3'
