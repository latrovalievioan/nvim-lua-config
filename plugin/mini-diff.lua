vim.pack.add({ 'https://github.com/echasnovski/mini.nvim' })

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
require("mini.statusline").setup()
require("mini.diff").setup({
    view = {
        style = "sign",
        signs = {
            add = "▎",
            change = "▎",
            delete = "▁"
        }
    }
})
