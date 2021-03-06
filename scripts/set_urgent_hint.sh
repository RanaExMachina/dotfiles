#!/bin/sh

# catch Evolution notifications
if [ "$1" == evolution-mail-notification ]; then
  wmctrl -r Evolution -b add,demands_attention
fi
# skype
if [ "$1" == Skype* ]; then
  wmctrl -r Skype -b add,demands_attention
fi
# whatsapp
if [[ "$1" == whats-app-nativefier-* ]]; then
  wmctrl -r WhatsApp -b add,demands_attention
fi
# thunderbird
if [[ "$1" == Thunderbird ]]; then
  wmctrl -xF -r Thunderbird -b add,demands_attention
fi

# debug output
echo $1
echo $@

wmctrl -r $1 -b add,demands_attention
