-- STATUSLINE

local config = function()
	-- local theme = require("lualine.themes.nightfox")

	-- -- set bg transparency in all modes
	-- theme.normal.c.bg = nil
	-- theme.insert.c.bg = nil
	-- theme.visual.c.bg = nil
	-- theme.replace.c.bg = nil
	-- theme.command.c.bg = nil

	require("lualine").setup()
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
