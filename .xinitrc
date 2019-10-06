# Non-reparenting window managers fix for Java
export _JAVA_AWT_WM_NONREPARENTING=1

# Export shell in which sxhkd will be run
export SXHKD_SHELL='/usr/bin/bash'

# Set screen blank time
xset s 1800 1800

# Run custom script on resolution change (for virtual machines)
#~/.local/bin/xeventbind resolution ~/.local/bin/resize &

# Load .Xresources
xrdb -load ~/.Xresources &

# Load monitors info
. ~/.local/bin/moninfo

# Set theme
~/.local/bin/themer --set

# Start hotkey daemon and bspwm
sxhkd -m 1 -t 20 &
exec bspwm
