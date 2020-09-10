#!/bin/bash
#script to execute on Xavier
video1=$1
video2=$2
gst-launch-1.0 -e videomixer name=mix sink_0::xpos=0 sink_0::ypos=0 sink_1::xpos=640 sink_1::ypos=0 ! queue ! videorate max-rate=30 ! autovideoconvert ! nvv4l2h265enc ! h265parse ! rtph265pay ! udpsink host=10.10.0.40 port=5000 v4l2src device=/dev/$video1 ! video/x-raw,format=YUY2,width=640,height=480 ! mix.sink_0 v4l2src device=/dev/$video2 ! video/x-raw,format=YUY2,width=640,height=480 ! mix.sink_1