local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)
    -- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set("n", "<space>wl", function()
    -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>lf", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
