gst-launch-1.0 -v \
  rtpbin name=rtpbin \
  udpsrc caps="application/x-rtp, media=video, encoding-name=H264, payload=96" port=5000 ! rtpbin.recv_rtp_sink_0 \
  rtpbin. ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink \
  udpsrc port=5001 ! rtpbin.recv_rtcp_sink_0 \
  rtpbin.send_rtcp_src_0 ! udpsink host=127.0.0.1 port=5005 sync=false async=false \
  udpsrc caps="application/x-rtp, media=audio, encoding-name=OPUS, payload=97" port=5002 ! rtpbin.recv_rtp_sink_1 \
  rtpbin. ! rtpopusdepay ! opusdec ! audioconvert ! autoaudiosink \
  udpsrc port=5003 ! rtpbin.recv_rtcp_sink_1 \
  rtpbin.send_rtcp_src_1 ! udpsink host=127.0.0.1 port=5006 sync=false async=false

