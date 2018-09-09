# Non-reparenting window managers fix for Java
export _JAVA_AWT_WM_NONREPARENTING=1

# Set screen blank time
xset s 1800 1800

# X mouse pointer fix
xsetroot -cursor_name left_ptr

# Set wallpaper
~/.fehbg &

# Run custom script on resolution change (for virtual machines)
#~/.local/bin/xeventbind resolution ~/.local/bin/resize &

# Reload .Xresources
xrdb -load ~/.Xresources &

# Prevent screen dimming/sleep
caffeine -d &

# Notifications server
dunst &

# Disk manager tray
udiskie -t &

# Composting manager
compton &

# Start hotkey daemon and bspwm
sxhkd -m 1 &
exec bspwm
