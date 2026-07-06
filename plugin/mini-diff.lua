vim.pack.add({ 'https://github.com/echasnovski/mini.nvim' })

require("mini.icons").setup()
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
