#!/bin/sh
export LD_LIBRARY_PATH=/opt/rv1106/lib:/oem/usr/lib:$LD_LIBRARY_PATH
insmod /root/88XXau_wfb.ko
sleep 1
/root/set_tx.sh

/root/start_wfb_tx.sh &

sleep 3

/root/test -w 1920 -h 1080 &

