gst-launch-1.0 filesrc location=../samples/tom.mp4 ! qtdemux name=demux demux.video_0 ! queue ! h264parse !  avdec_h264 ! videoconvert ! ximagesink -e


