#!/usr/bin/env bash
set -e

killall -q polybar || true
while pgrep -x polybar >/dev/null; do sleep 0.1; done

PRIMARY=$(xrandr --query | awk '/ connected primary/{print $1; exit}')
: "${PRIMARY:=$(xrandr --query | awk '/ connected/{print $1; exit}')}"

export MONITOR="$PRIMARY"
polybar main &
