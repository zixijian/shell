#!/bin/sh
# Android chroot charge limit controller
# author: zixijian
# website: zixijian.github.io
# co-author: Ethereal
# useage: crontab -e
#         */5 * * * * /usr/chargec.sh

# define
charge=`cat /sys/class/power_supply/battery/status`
capacity=`cat /sys/class/power_supply/battery/capacity`

echo Now battery is: $charge.
echo Now battery level is: $capacity.

# set max charge current 
# parameter: 800mA=800000
chmod 644 /sys/class/power_supply/battery/constant_charge_current_max
echo 800000 > /sys/class/power_supply/battery/constant_charge_current_max

# Redminote7pro violet,Redminote9pro gauguin 
# check max limit
if [ $capacity -ge 85 ]; then
# stop
  echo 1 > /sys/class/power_supply/battery/input_suspend 
fi

# check min limit
if [ $capacity -le 35 ]; then
# start 
  echo 0 > /sys/class/power_supply/battery/input_suspend
fi

:<<!
# Redminote4x mido 
# check max limit
if [ $capacity -ge 85 ]; then
# stop
  echo 0 > /sys/class/power_supply/battery/charging_enabled
fi

# check min limit
if [ $capacity -le 35 ]; then
# start
  echo 1 > /sys/class/power_supply/battery/charging_enabled
fi
!
