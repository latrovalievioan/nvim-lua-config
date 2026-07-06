vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

require("snacks").setup({
    picker = {},
    indent = {},
    scroll = {},
    statuscolumn = {
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
            open = true,
            git_hl = false,
        },
        git = {
            patterns = { "GitSign", "MiniDiffSign", "MiniDiff" },
        },
        refresh = 50,
    }
})

vim.keymap.set("n", "<leader>ff", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fw", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
vim.keymap.set("n", "gi", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gt", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto Type Definition" })
vim.keymap.set("n", "<leader>fW", function()
    local dir = vim.fn.input("Directory: ", vim.fn.getcwd(), "dir")
    if dir ~= "" then
        Snacks.picker.grep({ cwd = dir })
    end
end, { desc = "Grep in chosen directory" })
