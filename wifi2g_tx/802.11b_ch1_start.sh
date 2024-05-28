ifconfig wlan0 down
sleep 1
calibrator wlan0 plt power_mode on
sleep 1
calibrator wlan0 cc33xx_plt tune_channel 1 0 0
sleep 1
calibrator wlan0 cc33xx_plt set_tx -default 0
sleep 1
calibrator wlan0 cc33xx_plt set_tx -preamble_type 0 -phy_rate 1 -pkt_mode 0 -tx_power 10
sleep 1
-src_addr 04:05:05:05:05:04 -dst_addr 06:07:07:07:07:06
sleep 1
calibrator wlan0 cc33xx_plt start_tx
