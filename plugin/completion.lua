vim.opt.completeopt = "menuone,noselect,popup"

-- Enable built-in LSP completion for each LSP client
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
            autotrigger = true,
        })
    end,
})
