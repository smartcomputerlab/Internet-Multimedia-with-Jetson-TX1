gst-launch-1.0 -v udpsrc port=5000 caps="application/x-rtp, media=video, encoding-name=H264, payload=96" ! rtpbin name=rtpbin rtpbin.recv_rtp_sink_0 ! rtph264depay ! avdec_h264 ! autovideosink sync=false rtpbin.send_rtcp_src_0 ! udpsink host=192.168.1.31 port=5001 sync=false async=false udpsrc port=5005 caps="application/x-rtcp" ! rtpbin.recv_rtcp_sink_0

