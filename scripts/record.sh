#!/usr/bin/env bash

record() {
    videouri="$HOME/Videos/video_$(date '+%a__%b%d__%H_%M_%S').mp4"

    wf-recorder -g "$(slurp)" -r 24 -x yuv420p --audio='alsa_output.pci-0000_0d_00.6.analog-stereo.monitor' -f "$videouri" & echo $! > /tmp/recpid
    echo $videouri > /tmp/recuri

    notify-send -t 1500 "Recording started"
}

end() {
    kill "$(cat /tmp/recpid)" && rm -f /tmp/recpid

    echo "file:/$(cat /tmp/recuri)" | wl-copy -t text/uri-list && rm -f /tmp/recuri

    notify-send -t 1500 "Recording ended"
}

if test -f /tmp/recpid;
then
    end && exit 0
else
    record
fi
