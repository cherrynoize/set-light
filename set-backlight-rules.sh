#!/bin/sh
#
# Give video members permission to edit brightness settings
#
# https://github.com/cherrynoize/set-light
# Author: cherrynoize
#

# Backlight
chgrp video /sys/class/backlight/*/brightness
chmod g+w /sys/class/backlight/*/brightness

# Leds
chgrp video /sys/class/leds/*/brightness
chmod g+w /sys/class/leds/*/brightness
