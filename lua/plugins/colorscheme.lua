-- COLORSCHEME

return {
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
		lazy = false,
		config = function()
   vim.g.gruvbox_material_dim_inactive_windows = 1
			vim.g.gruvbox_material_better_performance = 1
			-- Fonts
			vim.g.gruvbox_material_disable_italic_comment = 0
			vim.g.gruvbox_material_enable_italic = 0
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_transparent_background = 0
			-- Themes
			vim.g.gruvbox_material_foreground = "medium"
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_ui_contrast = "high" -- The contrast of line numbers, indent lines, etc.
			vim.g.gruvbox_material_float_style = "dim" -- Background of floating windows

			vim.cmd("colorscheme gruvbox-material")
		end,
	},
}
