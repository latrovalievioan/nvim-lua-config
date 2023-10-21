local mapkey = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Directory Navigatio}n
mapkey.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })

-- Indenting
mapkey.set("v", "<", "<gv")
mapkey.set("v", ">", ">gv")

vim.keymap.set("n", "x", '"_x') -- delete single character without copying into register
vim.keymap.set("n", "=", "<C-a>") -- use = to increment num
vim.keymap.set("n", "-", "<C-x>") -- use - to decrement num
vim.keymap.set("i", "<C-c>", "<Esc>") -- use ctrl+c for esc

vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
