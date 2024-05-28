#!/bin/bash
calibrator wlan0 plt power_mode on
calibrator wlan0 cc33xx_plt tune_channel 1 0 0
calibrator wlan0 cc33xx_plt tx_start_tone 2 0