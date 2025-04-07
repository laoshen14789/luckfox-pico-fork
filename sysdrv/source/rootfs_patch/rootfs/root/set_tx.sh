#!/bin/bash
 
####
#"Usage: tx_rawsock [options] <interfaces>
#           Options:
#           -b <count>  Number of data packets in a block (default 8). Needs to match with rx.
#           -r <count>  Number of FEC packets per block (default 4). Needs to match with rx.
#           -f <bytes>  Number of bytes per packet (default %d, max. %d). This is also the FEC block size. Needs to match with rx.
#           -m <bytes>  Minimum number of bytes per frame (default: 28)
#           -p <port>   Port number 0-127 (default 0)
#           -t <type>   Frame type to send. 0 = DATA short, 1 = DATA standard, 2 = RTS
#           -d <rate>   Data rate to send frames with. Currently only supported with Ralink cards. Choose 6,12,18,24,36 Mbit
#           -y <mode>   Transmission mode. 0 = send on all interfaces, 1 = send only on interface with best RSSI
#           -z          Start measurement for auto bandwidth
#           -M          Use 802.11N MCS modes: 0,1,2,3
#           -S          Use STBC. Only for 802.11N\n  0\1
#           -L          Use LDPC. Only for 802.11n and 8812AU 0\1
#           Example:
#             cat /dev/zero | tx_rawsock -b 8 -r 4 -f 1024 -t 1 -d 24 -y 0 wlan0 (reads zeros from stdin and sends them out on wlan0) as standard DATA frames
####
 
 
WLAN=wlan0
 
BAND="5G"
#BAND="2G"
 
CHANNEL2G="6"
CHANNEL5G="149"
 
ifconfig $WLAN up
iw dev $WLAN set monitor otherbss
#iw reg set BO
ifconfig $WLAN up
 
case $BAND in
  "5G")
      echo "Setting $WLAN to channel $CHANNEL5G"
      iw dev $WLAN set channel $CHANNEL5G HT40+
      ;;
  "2G")
      echo "Setting $WLAN to channel $CHANNEL2G"
      iw dev $WLAN set channel $CHANNEL2G HT40+
      ;;
   *)
      echo "Select 2G or 5G band"
      exit -1;
      ;;
esac
 
