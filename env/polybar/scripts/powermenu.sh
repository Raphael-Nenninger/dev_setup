#!/usr/bin/env bash

choice=$(printf "Lock\nLogout\nReboot\nShutdown\n" | rofi -dmenu -i -p "Power")

case "$choice" in
  Lock)     i3lock -c 000000 || loginctl lock-session ;;
  Logout)   i3-msg exit ;;
  Reboot)   systemctl reboot ;;
  Shutdown) systemctl poweroff ;;
  *) exit 0 ;;
esac
