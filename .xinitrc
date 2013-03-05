# Set background
sh ~/.fehbg &

# Add icon font to fonts path
xset +fp /usr/share/fonts/dwm-icons/ &

# Load widget configuration
sh ~/.dwmrc &

# Remap keys
setxkbmap -option caps:escape

# Start window manager
exec dwm
