gst-launch-1.0 -v -e videotestsrc \
  ! openh264enc \
  ! h264parse \
  ! mp4mux name=mux \
  ! filesink location="../samples/bla.mp4" audiotestsrc \
  ! lamemp3enc \
  ! mux.

