CLIENT="192.168.8.102"
gst-launch-1.0 rtpbin name=rtpbin \
v4l2src device=/dev/video1 ! video/x-h264, width=1920, height=1080, framerate=30/1 ! queue ! h264parse ! rtph264pay ! rtpbin.send_rtp_sink_0 \
    rtpbin.send_rtp_src_0 ! udpsink host=$CLIENT port=5000  \
    rtpbin.send_rtcp_src_0 ! udpsink host=$CLIENT port=5001 \
    sync=false async=false    \
    udpsrc port=5005 ! rtpbin.recv_rtcp_sink_0           \
alsasrc device=hw:2 !  audio/x-raw, rate=16000,  channels=2 ! audioconvert ! speexenc ! queue ! rtpspeexpay ! rtpbin.send_rtp_sink_1  \
    rtpbin.send_rtp_src_1 ! udpsink host=$CLIENT port=5002   \
    rtpbin.send_rtcp_src_1 ! udpsink host=$CLIENT port=5003 \
    sync=false async=false    \
    udpsrc port=5007 ! rtpbin.recv_rtcp_sink_1

