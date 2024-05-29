#!/bin/bash

# 检查是否提供了参数
if [ -z "$1" ]; then
  echo "Usage: $0 <channel>"
  exit 1
fi

# 获取信道值
CHANNEL=$1

# 关闭WiFi接口
ifconfig wlan0 down
sleep 1

# 启用生产线测试模式
calibrator wlan0 plt power_mode on
sleep 1

# 调整到指定信道的频率
calibrator wlan0 cc33xx_plt tune_channel $CHANNEL 0 0
sleep 1

# 设置默认TX参数
calibrator wlan0 cc33xx_plt set_tx -default 0
sleep 1

# 设置802.11ax模式的发射参数
calibrator wlan0 cc33xx_plt set_tx -preamble_type 8 -phy_rate 12 -pkt_mode 0 -tx_power 10 -src_addr 04:05:05:05:05:04 -dst_addr 06:07:07:07:07:06
sleep 1

# 启动TX
calibrator wlan0 cc33xx_plt start_tx
