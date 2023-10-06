CLIENT=192.168.1.27
PORT_RTP_VIDEO=5000
PORT_RTCP_VIDEO=5001
PORT_RTP_AUDIO=5002
PORT_RTCP_AUDIO=5003
PORT_RTCP_VIDEO_RET=5005
PORT_RTCP_AUDIO_RET=5007

gst-launch-1.0 rtpbin name=rtpbin \
v4l2src device=/dev/video1 ! image/jpeg, width=640, height=480, framerate=30/1 ! rtpjpegpay ! rtpbin.send_rtp_sink_0 \
rtpbin.send_rtp_src_0 ! udpsink host=192.168.1.27 port=$PORT_RTP_VIDEO \
rtpbin.send_rtcp_src_0 ! udpsink host=192.168.1.27 port=$PORT_RTCP_VIDEO \
sync=false async=false \
udpsrc port=$PORT_RTCP_VIDEO_RET ! rtpbin.recv_rtcp_sink_0 \
alsasrc device="default" ! queue ! audioconvert ! audioresample ! audio/x-raw, rate=16000, width=16, channels=1 ! speexenc ! rtpspeexpay ! rtpbin.send_rtp_sink_1 \
rtpbin.send_rtp_src_1 ! udpsink host=192.168.1.27 port=$PORT_RTP_AUDIO \
rtpbin.send_rtcp_src_1 ! udpsink host=192.168.1.27 port=$PORT_RTCP_AUDIO \
sync=false async=false \
udpsrc port=$PORT_RTCP_AUDIO_RET ! rtpbin.recv_rtcp_sink_1

