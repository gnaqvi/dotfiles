#!/bin/bash

# Load display settings
autorandr -c default --skip-options gamma

# Non-reparenting window managers fix for Java
export _JAVA_AWT_WM_NONREPARENTING=1

# Export shell in which sxhkd will be run
export SXHKD_SHELL='/usr/bin/sh'

# Export config directory
export XDG_CONFIG_HOME="$HOME/.config"

# Set screen blank time
xset s 1800 1800

# Set keyboard repeat rate
xset r rate 200 30

# Load .Xresources
xrdb -load $HOME/.Xresources &

# Set wallpaper
$HOME/.local/bin/themer --wallpaper &

# Start hotkey daemon and bspwm
$XDG_CONFIG_HOME/sxhkd/launch
exec bspwm
