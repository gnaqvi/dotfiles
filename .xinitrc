# Non-reparenting window managers fix for Java
export _JAVA_AWT_WM_NONREPARENTING=1

# Export shell in which sxhkd will be run
export SXHKD_SHELL='/usr/bin/sh'

# Export config directory
export XDG_CONFIG_HOME="$HOME/.config"

# Set screen blank time
xset s 1800 1800

# Load .Xresources
xrdb -load ~/.Xresources &

# Load monitors info
. ~/.local/bin/moninfo

# Set wallpaper
~/.local/bin/themer --wall &

# Start hotkey daemon and bspwm
sxhkd -m 1 -t 20 &
exec bspwm
