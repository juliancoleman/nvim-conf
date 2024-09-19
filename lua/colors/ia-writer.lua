local colorbuddy = require("plugins.colorbuddy")

colorbuddy.colorscheme("ia-writer")

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

Color.new("white", "#ffffff")

Group.new("Normal", c.white)
