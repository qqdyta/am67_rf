#!/bin/bash
CHANNEL="$1"
cc33xx_enable_ble
sleep 1
hcitool cmd 08 34 $CHANNEL 255 0 2
