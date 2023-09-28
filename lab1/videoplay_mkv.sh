gst-launch-1.0 filesrc location=../samples/$1.mkv ! matroskademux name=demux ! h264parse ! avdec_h264 ! videoconvert ! autovideosink -e
