#!/bin/bash

# 关闭WiFi接口
ifconfig wlan0 down
sleep 1

# 启用生产线测试模式
calibrator wlan0 plt power_mode on
sleep 1

# 调整到2.4 GHz频段的信道6（2437 MHz）
calibrator wlan0 cc33xx_plt tune_channel 1 0 0
sleep 1

# 设置默认TX参数
calibrator wlan0 cc33xx_plt set_tx -default 0
sleep 1

# 设置802.11g模式的发射参数
calibrator wlan0 cc33xx_plt set_tx -preamble_type 2 -phy_rate 6 -pkt_mode 0 -tx_power 10 -src_addr 04:05:05:05:05:04 -dst_addr 06:07:07:07:07:06
sleep 1

# 启动TX
calibrator wlan0 cc33xx_plt start_tx