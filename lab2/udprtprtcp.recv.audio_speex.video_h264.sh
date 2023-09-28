
gst-launch-1.0 -v rtpbin name=rtpbin  \
     udpsrc caps="application/x-rtp, media=(string)video,clock-rate=(int)90000, encoding-name=(string)H264, encoding-params=(string)1" \
     port=8050 ! rtpbin.recv_rtp_sink_0  \
     rtpbin. ! queue ! rtph264depay ! h264parse ! avdec_h264 ! queue ! videoconvert ! xvimagesink \
     udpsrc port=8051 ! rtpbin.recv_rtcp_sink_0   \
     rtpbin.send_rtcp_src_0 ! udpsink port=8055 sync=false async=false   \
     udpsrc caps="application/x-rtp,media=(string)audio,clock-rate=(int)16000, encoding-name=(string)SPEEX, encoding-params=(string)1, payload=(int)110" \
     port=8052 ! rtpbin.recv_rtp_sink_1  \
     rtpbin. !  queue ! rtpspeexdepay ! decodebin ! audioconvert ! alsasink \
     udpsrc port=8053 ! rtpbin.recv_rtcp_sink_1  \
     rtpbin.send_rtcp_src_1 ! udpsink port=8057 sync=false async=false


