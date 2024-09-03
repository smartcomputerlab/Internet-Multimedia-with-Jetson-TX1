gst-launch-1.0 -v \
  rtpbin name=rtpbin \
  v4l2src device=/dev/video1 ! video/x-h264, framerate=30/1 ! h264parse ! rtph264pay config-interval=1 pt=96 ! rtpbin.send_rtp_sink_0 \
  rtpbin.send_rtp_src_0 ! udpsink host=192.168.1.31 port=5000 \
  rtpbin.send_rtcp_src_0 ! udpsink host=192.168.1.31 port=5001 sync=false async=false \
  alsasrc device="default" ! audioconvert ! audioresample ! audio/x-raw,rate=16000,channels=2 ! opusenc bitrate=64000 ! rtpopuspay pt=97 ! rtpbin.send_rtp_sink_1 \
  rtpbin.send_rtp_src_1 ! udpsink host=192.168.1.31 port=5002 \
  rtpbin.send_rtcp_src_1 ! udpsink host=192.168.1.31 port=5003 sync=false async=false \
  udpsrc port=5005 ! rtpbin.recv_rtcp_sink_0 \
  udpsrc port=5006 ! rtpbin.recv_rtcp_sink_1

