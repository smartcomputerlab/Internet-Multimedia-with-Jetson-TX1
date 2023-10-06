g++ -Wall $1.c -o $1 $(pkg-config --cflags --libs gstreamer-1.0)
