-- LANGUAGE SERVERS ...

local opts = {
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
        "elixirls"
    },

    automatic_installation = true,
}

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
}
