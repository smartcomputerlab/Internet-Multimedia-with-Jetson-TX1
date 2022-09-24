gst-launch-1.0 -e v4l2src  device="/dev/video0" ! 'video/x-raw,width=640,height=480,framerate=30/1' ! queue ! x264enc tune=zerolatency ! mux. \
alsasrc device=hw:2 ! audio/x-raw,channels=2 ,rate=16000 ! queue ! audioconvert ! lamemp3enc ! qtmux name=mux ! \
 filesink location=samples/webcammux.mp4 sync=false


