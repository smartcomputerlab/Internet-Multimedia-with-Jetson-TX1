 gst-launch-1.0 videotestsrc ! theoraenc ! rtptheorapay ! .send_rtp_sink rtpsession .send_rtp_src ! udpsink host=192.168.1.27 port=5000
