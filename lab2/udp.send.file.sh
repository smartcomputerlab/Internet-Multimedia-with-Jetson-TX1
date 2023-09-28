gst-launch-1.0 filesrc location='../samples/music.mp3' ! queue ! udpsink host=192.168.1.72 port=6666


