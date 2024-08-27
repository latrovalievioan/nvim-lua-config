-- LANGUAGE SERVERS ...

local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"tsserver",
		"solidity",
		"tailwindcss",
		"pyright",
		"html",
		"cssls",
		"lua_ls",
		"jsonls",
		"hls",
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
