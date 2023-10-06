gst-launch-1.0 -v filesrc location=../samples/tom.mp4 ! decodebin name=foo  foo. ! queue ! audioconvert ! audioresample ! vorbisenc ! oggmux name=bar  foo. ! queue ! videoconvert ! theoraenc ! bar. bar. ! filesink location=../samples/tom.ogv

