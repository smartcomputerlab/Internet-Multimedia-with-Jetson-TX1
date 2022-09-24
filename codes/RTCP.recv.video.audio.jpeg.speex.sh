source config.sh
gst-launch-1.0 -v rtpbin name=rtpbin \
  udpsrc caps="application/x-rtp, media=(string)video,clock-rate=(int)90000,
               encoding-name=(string)JPEG, encoding-params=(string)1" \
    port=$PORT_RTP_VIDEO ! rtpbin.recv_rtp_sin  \
    rtpbin. !  rtpjpegdepay ! decodebin ! queue ! videoconvert ! Xvimagesink \
  udpsrc port=5001 ! rtpbin.recv_rtcp_sink_0  \
    rtpbin.send_rtcp_src_0 ! udpsink port=5005 sync=false async=false  \    
  udpsrc caps="application/x-rtp, media=(string)audio, clock-rate=(int)16000,
      encoding-name=(string)SPEEX, encoding-params=(string)1, payload=(int)110" 
    port=5002 ! rtpbin.recv_rtp_sink_1  \
    rtpbin. !  rtpspeexdepay ! decodebin ! audioconvert ! alsasink \      
  udpsrc port=5003 ! rtpbin.recv_rtcp_sink_1  \
    rtpbin.send_rtcp_src_1 ! udpsink port=5007 sync=false async=false
    
    
