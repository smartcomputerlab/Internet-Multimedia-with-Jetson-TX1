gst-launch-1.0 nvcamerasrc num-buffers=300 fpsRange="30.0 30.0" ! 'video/x-raw(memory:NVMM), width=(int)1920, height=(int)1080, format=(string)I420, framerate=(fraction)30/1' ! \
nvvidconv flip-method=2 ! 'video/x-raw(memory:NVMM), format=(string)I420' ! \
omxh264enc bitrate=8000000 \
! 'video/x-h264, stream-format=(string)byte-stream' ! filesink location=test.h264 -e
