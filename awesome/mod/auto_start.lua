local awful = require("awful")

awful.spawn.once("setxkbmap -layout us")
awful.spawn.once("variety --next")
awful.spawn.once("picom")

awful.spawn.with_shell("~/.config/polybar/launch.sh")
