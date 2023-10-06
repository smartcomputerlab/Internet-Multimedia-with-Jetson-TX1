gst-launch-1.0 -v v4l2src device="/dev/video1" ! 'video/x-raw, width=320, height=240, framerate=30/1' ! \
 queue ! videorate ! 'video/x-raw,framerate=30/1' ! jpegenc quality=50 ! udpsink host=192.168.1.255 port=9005

