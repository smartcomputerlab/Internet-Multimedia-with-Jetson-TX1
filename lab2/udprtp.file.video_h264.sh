CLIENT_IP="192.168.1.27"
#gst-launch-1.0 -v filesrc location=../samples/$1 ! decodebin ! openh264enc  ! rtph264pay ! udpsink host=$CLIENT_IP port=8050 sync=true async=true
gst-launch-1.0 -v filesrc location=../samples/$1.mp4 ! qtdemux name=mux mux.video_0 ! h264parse ! rtph264pay ! udpsink host=$CLIENT_IP port=8050 sync=true async=true

