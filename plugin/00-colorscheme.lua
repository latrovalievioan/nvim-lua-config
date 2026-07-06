vim.pack.add({ 'https://github.com/sainnhe/gruvbox-material' })

vim.g.gruvbox_material_dim_inactive_windows = 1
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_disable_italic_comment = 0
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_foreground = "medium"
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_ui_contrast = "high"
vim.g.gruvbox_material_float_style = "dim"

vim.cmd("colorscheme gruvbox-material")
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "none" })

local file = io.open(vim.fn.expand("~/current-theme"), "r")
if file then
    local theme = file:read("*l")
    file:close()
    if theme == "light" or theme == "dark" then
        vim.o.background = theme
    end
end

local function toggle_theme()
    local output = vim.fn.system("tt")
    if output:find("light") then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end

vim.keymap.set('n', '<leader>tt', toggle_theme, { desc = 'Toggle theme' })
