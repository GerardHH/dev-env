local awful = require("awful")

local M = {}

-- This is used later as the default terminal and editor to run.
M.terminal = "alacritty"
M.editor = os.getenv("EDITOR") or "nano"
M.editor_cmd = M.terminal .. " -e " .. M.editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
M.modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
M.layouts = {
	awful.layout.suit.spiral.dwindle,
}

return M
