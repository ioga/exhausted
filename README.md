Exhausted, a battery status widget for Awesome WM.
=====

Exhausted is yet another battery status widget aimed for people, who are too
tired to know anything about their laptop battery unless it's discharging.

The code is loosely based on [Vicious](http://git.sysphere.org/vicious/),
[Delightful](http://scm.solitudo.net/gitweb/public/?p=delightful.git;a=summary),
[Obvious](http://git.mercenariesguild.net/?p=obvious.git;a=summary),
and `awful.widget.textclock`.

Requirements
-----
- awesome 3.5
- [sys-power/acpi](http://sourceforge.net/projects/acpiclient/)

Usage
-----
Clone this repository into your `$XDG_CONFIG_HOME/awesome` (i.e. to
awesome config dir). Add to the top of rc.lua:

    local exhausted = require("exhausted")

Then create a widget and add to wibox layout, just like any other widget:

    mybattery = exhausted.widget()
    right_layout:add(mybattery)

And that's it! You're good to go.

Screenshot
-----
![Screenshot][1]

[1]: http://github.com/ioga/exhausted/raw/master/screenshot.png

License
-----
Licensed under terms of GNU GPLv3.
Copyright (C) 2013 Ilia Glazkov.
