#gst-launch-1.0 -v v4l2src device=/dev/video0 ! video/x-h264, width=640, height=480, framerate=30/1 ! h264parse ! rtph264pay config-interval=1 pt=96 ! udpsink host=192.168.1.31 port=5000 sync=false async=false rtpbin name=rtpbin udpsink port=5001 host=192.168.1.31 sync=false async=false udpsrc caps="application/x-rtcp" port=5005 ! rtpbin.recv_rtcp_sink_0 rtpbin.send_rtcp_src_0 ! udpsink host=192.168.1.31 port=5005 sync=false async=false
gst-launch-1.0 -v v4l2src device=/dev/video0 ! video/x-h264, width=640, height=480, framerate=30/1 ! h264parse ! rtph264pay config-interval=1 pt=96 ! rtpbin name=rtpbin latency=100 send_rtp_sink_0 ! udpsink host=127.0.0.1 port=5000 rtpbin.send_rtcp_src_0 ! udpsink host=127.0.0.1 port=5001 sync=false async=false udpsrc port=5005 ! rtpbin.recv_rtcp_sink_0




