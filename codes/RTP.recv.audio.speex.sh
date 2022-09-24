source config.sh
gst-launch-1.0 -v udpsrc caps="application/x-rtp,media=(string)audio,clock-rate=(int)16000, encoding-name=(string)SPEEX, encoding-params=(string)1, payload=(int)110"  port=$PORT_RTP_AUDIO ! queue ! rtpspeexdepay ! decodebin ! audioconvert ! alsasink 

