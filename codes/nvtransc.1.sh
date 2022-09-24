gst-launch-1.0 filesrc location=test.mp4 ! qtdemux name=demux ! queue ! mpeg4videoparse ! omxmpeg4videodec ! nvvidconv ! theoraenc ! oggmux name=mux ! filesink location=test.ogg -e
