IP_CLIENT=192.168.1.72
PORT_VIDEO1_RTP=9000
PORT_VIDEO1_RTCP=9001
PORT_VIDEO1_RTCP_RET=9005
PORT_VIDEO2_RTP=9002
PORT_VIDEO2_RTCP=9003
PORT_VIDEO2_RTCP_RET=9007

gst-launch-1.0 -v rtpbin name=rtpbin \
udpsrc caps="application/x-rtp,media=(string)video,clock-rate=(int)90000,encoding-name= (string)H264" \
port=$PORT_VIDEO1_RTP ! rtpbin.recv_rtp_sink_0 \
rtpbin. ! queue ! rtph264depay ! h264parse ! avdec_h264 ! videoconvert ! autovideosink \
udpsrc port=$PORT_VIDEO1_RTCP ! rtpbin.recv_rtcp_sink_0 \
rtpbin.send_rtcp_src_0 ! udpsink host=$IP_CLIENT port=$PORT_VIDEO1_RTCP_RET sync=false async=false \

udpsrc caps="application/x-rtp,media=(string)video,clockrate=(int)90000,encoding-name=(string)H264" \
port=$PORT_VIDEO2_RTP ! rtpbin.recv_rtp_sink_1 \
rtpbin. ! queue ! rtph264depay ! h264parse ! avdec_h264 ! videoconvert ! autovideosink \
udpsrc port=$PORT_VIDEO2_RTCP ! rtpbin.recv_rtcp_sink_1 \
rtpbin.send_rtcp_src_1 ! udpsink host=$IP_CLIENT port=$PORT_VIDEO2_RTCP_RET sync=false async=false

