-- FZF

local mapkey = vim.keymap

local config = function()
	local telescope = require("telescope")
	telescope.setup({
    defaults = {
        layout_strategy = 'vertical',
        layout_config = {
            height = 0.99,
            width = 0.99,
            preview_cutoff = 1
        }
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
		mapkey.set("n", "<leader>ff", ":Telescope find_files<CR>"),
		mapkey.set("n", "<leader>f", ":Telescope git_files<CR>"),
		mapkey.set("n", "<leader>st", ":Telescope live_grep<CR>"),
		mapkey.set("n", "<leader>fb", ":Telescope buffers<CR>"),
	},
}
