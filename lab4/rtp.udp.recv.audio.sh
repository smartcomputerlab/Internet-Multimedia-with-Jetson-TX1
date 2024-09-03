gst-launch-1.0 -v udpsrc port=5002 caps="application/x-rtp, media=audio, encoding-name=OPUS, payload=97" ! rtpjitterbuffer ! rtpopusdepay ! opusdec ! audioconvert ! autoaudiosink

