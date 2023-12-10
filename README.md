# set-light

Minimal backlight manager initially developed as a replacement for
`light` after it became officially abandoned. It's a simple
shell script with only basic options. It also supports a
minimum (as well as maximum) threshold and both relative and
absolute brightness values.

## Install

    git clone https://github.com/cherrynoize/set-light
    cd set-light
    make install

The makefile adds us to the `video` group so we can write to the
file without root privileges. It also creates, enables and starts
the `[set-brightness-rules.service](set-brightness-rules.service)`
`systemd` service to set the group and permissions for the
backlight and leds brightness files.

This substitutes the `udev` rules which caused the `chgrp` and
`chmod` commands to be triggered randomly many times and clutter
the journal as well.

>Do not run `make install` as `root` or it will not add the
correct user to the group. `sudo` is used in the makefile
instead.

## Configuration

You can edit the default step for brightness change, the
threshold values and path to the backlight device in the source
file. Useful variables can be found at the top of the script.

## Usage

    Usage:
      set-light [OPTION] [VALUE]

    Description:
      Sets backlight brightness value. Add \`r\` to use percentage
      (relative) values rather than absolute. \`a\` means absolute
      and is the default value.

      set-light only supports a single option before VALUE. Do not
      separate command line arguments into multiple options.

      Returns current brightness if called with no value argument.

    Options:
      -m               set minimum value
      -M               set maximum value
      -d[r|a] VALUE    decrease by VALUE
      -u[r|a] VALUE    increase by VALUE
      -[s][r|a] VALUE  set VALUE (default option)
      -v | --version   print version
      -h | --help      show this help message

    Examples:
      # get current backlight percentage
      set-light -r
      # set maximum brightness
      set-light -M
      # decrease brightness by 15
      set-light -d 15
      # increase brightness by 5%
      set-light -ur 5
      # set brightness to half
      set-light -r 50

## WM integration

### awesome

If you want a backlight widget for awesome that also supports
set-light check out [Ctrl](https://github.com/cherrynoize/ctrl).

### sxhkd

sxhkd keybindings for bspwm or any other wm for that matter.

    # brightness set value
    super + u; {0-9}; l
        set-light -r {0-9}
    super + u; {0-9}; {0-9}; l
        set-light -r {0-9}{0-9}

    # brightness down/up
    XF86MonBrightness{Down,Up}
        set-light -{dr,ur} 7

    # brightness min/max
    super + XF86MonBrightness{Down,Up}
        set-light -{m,M}

## Contribution

Please do consider opening a pull request or reaching out to me at
[cherrynoize@duck.com](mailto:cherrynoize@duck.com) for any bugs or
whatever.
