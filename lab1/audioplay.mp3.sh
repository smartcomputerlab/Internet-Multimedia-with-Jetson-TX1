gst-launch-1.0 filesrc location=../samples/$1.mp3 ! mpegaudioparse !  avdec_mp3 ! audioconvert ! autoaudiosink -e


