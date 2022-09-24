CLIENT="192.168.8.102"
gst-launch-1.0 -tv v4l2src device=/dev/video1 ! textoverlay text="Text Overlay"! omxh264enc bitrate=3000000 control-rate=2 \
 ! h264parse ! queue ! rtph264pay config-interval=1 pt=96 !  .send_rtp_sink rtpsession name=session .send_rtp_src \
 ! udpsink port=5000 host=$CLIENT session.send_rtcp_src ! udpsink port=5001 host=$CLIENT
