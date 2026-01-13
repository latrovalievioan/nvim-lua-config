-- autocmd [] event pattern command
vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*Jenkins*",
    callback = function()
        vim.opt.filetype = "groovy"
    end
})

vim.api.nvim_create_autocmd("BufRead", {
    pattern = ".env.*",
    callback = function()
        vim.opt.filetype = "sh"
    end
})

vim.api.nvim_create_user_command('LspInfo', function()
    vim.print(vim.lsp.get_clients({ bufnr = 0 }))
end, {})
