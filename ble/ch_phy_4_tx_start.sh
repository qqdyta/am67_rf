#!/bin/bash

# 检查是否提供了频道参数
if [ -z "$1" ]; then
  echo "Usage: $0 <CHANNEL>"
  exit 1
fi

CHANNEL="$1"


# 检查命令是否成功
if [ $? -ne 0 ]; then
  echo "Failed to enable BLE"
  exit 1
fi

# 等待1秒钟以确保BLE模块启用
sleep 1

# 发送 hcitool 命令
hcitool cmd 08 34 $CHANNEL 255 0 4

# 检查 hcitool 命令是否成功
if [ $? -ne 0 ]; then
  echo "Failed to execute hcitool command"
  exit 1
fi

echo "Command executed successfully"

