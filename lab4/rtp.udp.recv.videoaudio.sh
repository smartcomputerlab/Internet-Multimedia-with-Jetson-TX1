gst-launch-1.0 -v udpsrc port=5000 caps="application/x-rtp, media=video, encoding-name=H264, payload=96" ! rtpjitterbuffer ! rtph264depay ! avdec_h264 ! videoconvert ! ximagesink udpsrc port=5002 caps="application/x-rtp, media=audio, encoding-name=OPUS, payload=97" ! rtpjitterbuffer ! rtpopusdepay ! opusdec ! audioconvert ! autoaudiosink

