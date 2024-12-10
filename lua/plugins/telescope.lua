-- FZF
local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			layout_strategy = "vertical",
			layout_config = {
				height = 0.99,
				width = 0.99,
				preview_cutoff = 1,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>"),
		vim.keymap.set("n", "<leader>f", ":Telescope git_files<CR>"),
		vim.keymap.set("n", "<leader>fw", ":Telescope live_grep<CR>"),
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>"),
        vim.keymap.set("n", "<leader>fs", ":Telescope git_status<CR>"),
	},
}
