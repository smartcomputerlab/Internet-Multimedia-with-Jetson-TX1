IP_CLIENT=192.168.1.72
PORT_VIDEO1_RTP=9000
PORT_VIDEO1_RTCP=9001
PORT_VIDEO1_RTCP_RET=9005
PORT_VIDEO2_RTP=9002
PORT_VIDEO2_RTCP=9003
PORT_VIDEO2_RTCP_RET=9007

gst-launch-1.0 rtpbin name=rtpbin \
v4l2src device=/dev/video1 ! video/x-h264, width=640,height=480, framerate=30/1 ! queue ! h264parse ! rtph264pay pt=96 ! rtpbin.send_rtp_sink_0 \
rtpbin.send_rtp_src_0 ! udpsink host=$IP_CLIENT port=$PORT_VIDEO2_RTP \
rtpbin.send_rtcp_src_0 ! udpsink host=$IP_CLIENT port=$PORT_VIDEO2_RTCP sync=false async=false \
udpsrc port=$PORT_VIDEO2_RTCP_RET ! rtpbin.recv_rtcp_sink_0 \
v4l2src device=/dev/video3 ! video/x-h264, width=640, height=480, framerate=30/1 ! queue ! h264parse ! rtph264pay pt=96 ! rtpbin.send_rtp_sink_1 \
rtpbin.send_rtp_src_1 ! udpsink host=$IP_CLIENT port=$PORT_VIDEO1_RTP \
rtpbin.send_rtcp_src_1 ! udpsink host=$IP_CLIENT port=$PORT_VIDEO1_RTCP sync=false async=false \
udpsrc port=$PORT_VIDEO1_RTCP_RET ! rtpbin.recv_rtcp_sink_1 \



