# set-light

Minimal backlight manager initially developed as a replacement for
`light` after it became officially abandoned. It's a simple
shell script with only basic options. It also supports a
minimum (as well as maximum) threshold and both relative and
absolute brightness values.

## Install

    git clone https://github.com/cherrynoize/set-light
    cd set-light
    chmod +x set-light
    cp set-light /usr/local/bin/

## Configuration

You can easily edit the default step for brightness change, the
threshold values and path to the backlight device in the source
file. Useful variables can be found at the top of the script.

## Usage

    set-light [OPTION] [VALUE]

    Sets backlight brightness value. Add `r` to use percentage
    (relative) values rather than absolute. `a` means absolute
    and is the default value.

    set-light only supports a single option before VALUE. Do not
    separate command line arguments into multiple options.

    Returns current brightness if called with no arguments.

    -m               set maximum value
    -d[r|a] VALUE    decrease by VALUE
    -u[r|a] VALUE    increase by VALUE
    -[s][r|a] VALUE  set VALUE (default option)
    -v | --version   print version
    -h | --help      show this help message

    Examples:

    # set maximum brightness
    set-light -m
    # decrease brightness by 15
    set-light -d 15
    # increase brightness by 5%
    set-light -ur 5
    # set brightness to half
    set-light -r 50
