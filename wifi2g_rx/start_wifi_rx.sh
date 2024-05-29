#!/bin/bash

INTERFACE="wlan0"
SOURCE_MAC="04:05:05:05:05:04"
CHANNEL="$1"

# 检查网络接口是否存在
if ! ip link show "$INTERFACE" > /dev/null 2>&1; then
  echo "Interface $INTERFACE does not exist."
  exit 1
fi

# 启用电源模式
calibrator $INTERFACE plt power_mode on
if [ $? -ne 0 ]; then
  echo "Failed to set power mode on."
  exit 1
fi
sleep 1

# 调整频道
calibrator $INTERFACE cc33xx_plt tune_channel $CHANNEL 0 0
if [ $? -ne 0 ]; then
  echo "Failed to tune channel $CHANNEL."
  exit 1
fi
sleep 1

# 启动接收模式
calibrator $INTERFACE cc33xx_plt start_rx -source_mac $SOURCE_MAC -ack_enable 1
if [ $? -ne 0 ]; then
  echo "Failed to start RX mode."
  exit 1
fi
sleep 1

# 获取接收统计信息
calibrator $INTERFACE cc33xx_plt get_rx_stats
if [ $? -ne 0 ]; then
  echo "Failed to get RX stats."
  exit 1
fi

echo "Commands executed successfully"
