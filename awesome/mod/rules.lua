-- local beautiful = require("beautiful")
local awful = require("awful")

local keys = require("mod.keys")

local clientkeys = keys.clientkeys
local clientbuttons = keys.clientbuttons

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	{
		rule = {},
		properties = {
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},
	{
		rule = {},
		except_any = { class = { "Polybar" } },
		-- properties = {
		-- 	border_width = beautiful.border_width,
		-- 	border_color = beautiful.border_normal,
		-- 	focus = awful.client.focus.filter,
		-- },
	},
}
