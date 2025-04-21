vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Directory Navigatio}n
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })

-- Indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "x", '"_x') -- delete single character without copying into register
vim.keymap.set("n", "=", "<C-a>") -- use = to increment num
vim.keymap.set("n", "-", "<C-x>") -- use - to decrement num
vim.keymap.set("i", "<C-c>", "<Esc>") -- use ctrl+c for esc

vim.keymap.set("n", "<S-l>", ":tabnext<CR>")
vim.keymap.set("n", "<S-h>", ":tabprev<CR>")

-- LSP
local opts = { noremap = true, silent = true}

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<space>lf", function()
    vim.lsp.buf.format({ async = true })
end, opts)
