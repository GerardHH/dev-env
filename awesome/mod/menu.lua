local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

local definitions = require("mod.definitions")

local M = {}

-- Create a launcher widget and a main menu
local myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", definitions.terminal .. " -e man awesome" },
	{ "edit config", definitions.editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

M.menu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "open terminal", definitions.terminal },
	},
})

M.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = M.menu })

return M
