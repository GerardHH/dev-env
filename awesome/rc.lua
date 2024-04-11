-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local menubar = require("menubar")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
require("mod.error_handling")
-- }}}

-- {{{ Variable definitions
local definitions = require("mod.definitions")
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
awful.layout.layouts = definitions.layouts
-- }}}

-- {{{ Menu

-- Menubar configuration
menubar.utils.terminal = definitions.terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
require("mod.status_bar")
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
local keys = require("mod.keys")

local globalkeys = keys.globalkeys

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
require("mod.rules")
-- }}}

-- {{{ Signals
require("mod.signals")
-- }}}

require("mod.auto_start")
