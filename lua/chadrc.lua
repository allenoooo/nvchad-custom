-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  transparency = true,
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- },
    hl_override = {
		["@comment"] = {
      fg = "#9A7D0A",
    },
    Comment = {
      fg = "#9A7D0A",
    }
  },
}

return M
