#!/bin/bash


{
  bluetoothctl connect DC:2C:26:E4:8E:EE &
  sleep 2
  xmodmap "${HOME}/.config/keymaps/.real_prog_dvorak" &
  xmodmap -e "clear lock" &
} ||
{
  echo "error trying to connect to keyboard"
}

