CLIENT_IP="192.168.1.62"
gst-launch-1.0 -v filesrc location=../samples/$1 ! decodebin name=foo foo. ! queue ! openh264enc ! rtph264pay ! udpsink host=$CLIENT_IP port=8050 sync=true \
	foo. ! audioconvert ! speexenc ! queue ! rtpspeexpay ! udpsink host=$CLIENT_IP port=8052 sync=true

