source config.sh
gst-launch-1.0 rtpbin name=rtpbin \
v4l2src device=/dev/video2 ! video/x-h264, width=1920, height=1080, framerate=30/1 ! rtph264pay ! rtpbin.send_rtp_sink_0 \
    rtpbin.send_rtp_src_0 ! udpsink host=$CLIENT port=$PORT_RTP_VIDEO  \
    rtpbin.send_rtcp_src_0 ! udpsink host=$CLIENT port=$PORT_RTCP_VIDEO \
    sync=false async=false    \
    udpsrc port=$PORT_RTCP_VIDEO_RET ! rtpbin.recv_rtcp_sink_0   \
alsasrc device=hw:2 ! audio/x-raw,rate=16000,channels=2 ! audioconvert ! speexenc ! queue !rtpspeexpay ! rtpbin.send_rtp_sink_1    \
    rtpbin.send_rtp_src_1 ! udpsink host=$CLIENT port=$PORT_RTP_AUDIO   \
    rtpbin.send_rtcp_src_1 ! udpsink host=$CLIENT port=$PORT_RTCP_AUDIO \
    sync=false async=false    \
    udpsrc port=$PORT_RTCP_AUDIO_RET ! rtpbin.recv_rtcp_sink_1
    
    
