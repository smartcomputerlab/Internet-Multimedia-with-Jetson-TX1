gst-launch-1.0 filesrc location=tom.mp4 ! qtdemux name=demux ! h264parse ! omxh264dec ! nvoverlaysink -e
