ifconfig wlan0 down
sleep 1
calibrator wlan0 plt power_mode on
sleep 1
calibrator wlan0 cc33xx_plt set_antenna_mode_24G 2 2 0 1 0 1
sleep 1
calibrator wlan0 cc33xx_plt tune_channel 6 0 0
sleep 1
calibrator wlan0 cc33xx_plt set_tx_power 20000 0 0 1 0 0 0 0 0 0 0 0
sleep 1
calibrator wlan0 cc33xx_plt start_tx 200 3 1000 0 0 0 0 0 00:00:DE:DE:BE:BE 12:34:56:78:90:AB 0


