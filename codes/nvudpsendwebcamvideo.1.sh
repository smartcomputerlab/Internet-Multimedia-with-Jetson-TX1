gst-launch-1.0 -v v4l2src device="/dev/video0" ! 'video/x-raw, width=320, height=240, framerate=30/1' ! queue ! videorate ! 'video/x-raw,framerate=30/1' ! jpegenc quality=50 ! udpsink host=192.168.43.159 port=5005


