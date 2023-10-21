return {
	"f-person/git-blame.nvim",
	event = "bufread",
	config = function()
		vim.cmd("highlight default link gitblame specialcomment")
		vim.g.gitblame_enabled = 1
	end,
}
