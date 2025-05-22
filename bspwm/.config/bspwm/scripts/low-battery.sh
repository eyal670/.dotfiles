#!/usr/bin/bash

# use crontab to run low-battert.sh script every 2 min
# */2 * * * * $HOME/.config/bspwm/scripts/low-battery.sh

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
BATTERY_CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

ALERT_LIMIT=15
LOW_LIMIT=5

if [[ $BATTERY_CAPACITY -le $ALERT_LIMIT && $BATTERY_CAPACITY -gt $LOW_LIMIT && $BATTERY_STATUS = "Discharging" ]]; then
  notify-send "battery is low" "<b>please connect the charger NOW! </b> \ncapacity: $BATTERY_CAPACITY% | status: $BATTERY_STATUS"
fi

if [[ $BATTERY_CAPACITY -le $LOW_LIMIT && $BATTERY_STATUS = "Discharging" ]]; then
  notify-send "battery is critical low" "<b>computer will shutdown in 60 sec</b> \ncapacity: $BATTERY_CAPACITY% | status: $BATTERY_STATUS"
  sleep 60s
  BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
  if [[ $BATTERY_STATUS = "Discharging" ]]; then
    systemctl poweroff
  elif [[ $BATTERY_STATUS = "Charging" ]]; then
    notify-send "charger connected" "<b>computer shutdown disabled</b> \nstatus: $BATTERY_STATUS"
  fi
fi
