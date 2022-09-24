#gst-launch-1.0 filesrc location=music.mp3 ! mpegaudioparse !  avdec_mp3 ! audioconvert ! alsasink -e
gst-launch-1.0 filesrc location=music.mp3 ! mpegaudioparse !  mad ! audioconvert ! alsasink -e


