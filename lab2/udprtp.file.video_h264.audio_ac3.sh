# sender `mp4` file
HOST=192.168.1.27
gst-launch-1.0 -v filesrc location=../samples/tom.mp4 \
  ! qtdemux name=demux qtdemux name=mux \
  ! rtpqtpay \
  ! udpsink host=$HOST port=5000 demux. \
  ! queue ! h264parse ! decodebin ! openh264enc ! mux. demux. \
  ! queue ! mp4aparse  ! mux.
