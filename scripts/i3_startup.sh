#!/bin/bash

#  VARIABLES

LAPTOP_HOSTNAME="archbook"
DESKTOP_HOSTNAME="snitsig"

# needed when i3 is started via sddm

xset r rate 250 50


#setxkbmap us altgr-intl
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

xmodmap -e 'clear Lock' #ensures you're not stuck in CAPS on mode
xmodmap -e 'keycode 0x42=Escape' #remaps the keyboard so CAPS LOCK=ESC

case $HOSTNAME in
    ("$LAPTOP_HOSTNAME")
    #  laptop specific settings
    /home/nicolai/dotfiles/scripts/laptop-touchpad-settings.sh;;
    ("$DESKTOP_HOSTNAME")
    #  desktop specific settings
        ;;
esac
