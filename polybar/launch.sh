#!/bin/bash

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
      MONITOR=$m polybar --reload bar1 &
  done
  #for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  #  MONITOR=$m polybar --reload bar1 &
  #done
else
  polybar --reload bar1 &
fi

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
# polybar bar1 &

echo "Polybar launched..."