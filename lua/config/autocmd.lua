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
  for _, client in pairs(vim.lsp.get_clients({bufnr = 0})) do print(client.name) end
end, {})
