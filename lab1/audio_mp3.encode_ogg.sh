gst-launch-1.0 -v filesrc location="../samples/music.mp3" ! decodebin !  audioconvert ! audioresample ! vorbisenc ! oggmux ! filesink location=../samples/music.ogg
