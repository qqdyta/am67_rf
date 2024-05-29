#!/bin/bash
calibrator wlan0 plt power_mode on
sleep 1
calibrator wlan0 cc33xx_plt tune_channel 6 0 0
sleep 1
calibrator wlan0 cc33xx_plt start_rx -source_mac 04:05:05:05:05:04 -ack_enable 1
sleep 1
calibrator wlan0 cc33xx_plt get_rx_stats