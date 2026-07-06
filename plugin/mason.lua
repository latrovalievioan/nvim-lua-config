vim.pack.add({
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "efm",
        "bashls",
        "ts_ls",
        "solidity",
        "tailwindcss",
        "pyright",
        "html",
        "cssls",
        "lua_ls",
        "jsonls",
    },
    automatic_installation = true,
})
