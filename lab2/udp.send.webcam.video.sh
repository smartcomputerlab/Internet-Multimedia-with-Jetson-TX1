source config.sh
gst-launch-1.0 -v v4l2src device="/dev/video1" ! queue ! 'image/jpeg, width=1280, height=720, framerate=30/1' ! queue ! udpsink host=192.168.1.62 port=9005



