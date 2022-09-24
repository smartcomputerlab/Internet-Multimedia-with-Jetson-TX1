gst-launch-1.0 filesrc location=tom.mp4 ! qtdemux name=demux demux.audio_0 ! queue ! mpegaudioparse !  avdec_mp3 ! audioconvert ! alsasink -e


