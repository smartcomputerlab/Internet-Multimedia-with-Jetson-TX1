gst-launch-1.0 filesrc location=tgtbtu.mkv ! matroskademux name=demux ! h264parse ! omxh264dec ! nveglglessink -e
