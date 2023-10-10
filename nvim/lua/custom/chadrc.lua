---@type ChadrcConfig
local M = {}
-- M.ui = {theme = 'nightfox'}
M.ui = {
  theme = "nightfox",
  transparency = false,

  hl_override = {
    NvDashAscii = {
      fg = "blue",
      bg = "none",
    },
    NvDashButtons = {
      bg = "none",
      fg = "light_grey",
    },
  },

  nvdash = {
    load_on_startup = true,

    header = {
      "                             ",
      "     ▄▄         ▄ ▄▄▄▄▄▄▄    ",
      "   ▄▀███▄     ▄██ █████▀     ",
      "   ██▄▀███▄   ███            ",
      "   ███  ▀███▄ ███            ",
      "   ███    ▀██ ███            ",
      "   ███      ▀ ███            ",
      "   ▀██ █████▄▀█▀▄██████▄     ",
      "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀    ",
      "                             ",
    },
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
