gst-launch-1.0 filesrc location=../samples/$1.mp4 ! qtdemux name=demux ! h264parse ! avdec_h264 ! videoconvert ! autovideosink -e
