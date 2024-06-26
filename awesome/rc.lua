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

-- {{{ Error handling
require("mod.error_handling")
-- }}}

-- {{{ Variable definitions
local definitions = require("mod.definitions")

-- Themes define colours, icons, font and wallpapers.
local theme = require("mod.theme")
beautiful.init(theme)

awful.layout.layouts = definitions.layouts
-- }}}

-- {{{ Menu
local menu = require("mod.menu")

-- Menubar configuration
menubar.utils.terminal = definitions.terminal -- Set the terminal for applications that require it
-- }}}

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Set up every screen
awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
end)

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function()
		menu.menu:toggle()
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
