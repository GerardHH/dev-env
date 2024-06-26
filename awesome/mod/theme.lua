---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.useless_gap = 5
theme.border_width = 1

theme.font = "hack"

theme.black = "#1e1e28"
theme.deep_black = "#1b1923"
theme.white = "#d7dae0"
theme.light_white = "#fafafa"
theme.pink = "#f0afe1"
theme.red = "#e28c8c"
theme.orange = "#f9c096"
theme.yellow = "#eadda0"
theme.green = "#b3e1a3"
theme.blue = "#a4b9ef"
theme.purple = "#c6aae8"
theme.grey = "#6e6c7c"

theme.bg_normal = theme.black
theme.bg_focus = theme.deep_black
theme.bg_urgent = theme.white
theme.bg_minimize = theme.grey
theme.bg_systray = theme.black

theme.fg_normal = theme.white
theme.fg_focus = theme.orange
theme.fg_urgent = theme.red
theme.fg_minimize = theme.light_white

theme.border_normal = theme.blue
theme.border_focus = theme.green
theme.border_marked = theme.purple

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming the menu:
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- Define the image to load
theme.wallpaper = themes_path .. "default/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

return theme
