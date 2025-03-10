-- LSP STUFF

local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- mdx
	lspconfig.mdx_analyzer.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "mdx" },
	})

	-- tailwind
	lspconfig.tailwindcss.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "typescriptreact", "javascriptreact" },
	})

	-- json
	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "json", "jsonc" },
	})

	-- eslint
	lspconfig.eslint.setup({
		capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro", "svg", "html" },
		on_attach = function(_, bufnr)
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				command = "EslintFixAll",
			})
		end,
	})

	lspconfig.elixirls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "elixir", "eelixir", "heex", "surface" },
		root_dir = lspconfig.util.root_pattern("mix.exs", ".git") or vim.loop.os_homedir(),
		cmd = { "/opt/homebrew/bin/elixir-ls" },
	})

    lspconfig.csharp_ls.setup({
        capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "cs" },
    })

  --   lspconfig.csharpier.setup({
  --       capabilities = capabilities,
		-- on_attach = on_attach,
		-- filetypes = { "cs" },
  --   })

	-- typescript
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"typescript",
			"typescriptreact",
			"javascript",
			"javascriptreact",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	lspconfig.stylelint_lsp.setup({
		filetypes = { "css", "scss" },
		settings = {
			stylelintplus = {
				autoFixOnSave = true,
				autoFixOnFormat = true,
			},
		},
	})

	lspconfig.gopls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig.hls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

    lspconfig.bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
    })

	-- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	-- lspconfig.emmet_ls.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	filetypes = {
	-- 		"html",
	-- 		"typescriptreact",
	-- 		"javascriptreact",
	-- 		"javascript",
	-- 		"css",
	-- 		"sass",
	-- 		"scss",
	-- 		"less",
	-- 		"svelte",
	-- 		"vue",
	-- 	},
	-- })

	-- local luacheck = require("efmls-configs.linters.luacheck")
	-- local stylua = require("efmls-configs.formatters.stylua")
	-- local fixjson = require("efmls-configs.formatters.fixjson")
	-- local gofumpt = require("efmls-configs.formatters.gofumpt")
	-- local go_revive = require("efmls-configs.linters.go_revive")
	-- local prettier = require("efmls-configs.formatters.prettier_d")
	--
	-- configure efm server
	-- lspconfig.efm.setup({
	-- 	filetypes = {
	-- 		"lua",
	-- 		"python",
	-- 		"json",
	-- 		"jsonc",
	-- 		"sh",
	-- 		"javascript",
	-- 		"javascriptreact",
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 		"svelte",
	-- 		"vue",
	-- 		"markdown",
	-- 		"docker",
	-- 		"solidity",
	-- 		"go",
	-- 	},
	-- 	init_options = {
	-- 		documentFormatting = true,
	-- 		documentRangeFormatting = true,
	-- 		hover = true,
	-- 		documentSymbol = true,
	-- 		codeAction = true,
	-- 		completion = true,
	-- 	},
	-- 	settings = {
	-- 		languages = {
	-- 			-- lua = { luacheck, stylua },
	-- 			typescript = { prettier },
	-- 			javascript = { prettier },
	-- 			css = { prettier },
	-- 			javascriptreact = { prettier },
	-- 			typescriptreact = { prettier },
				-- go = { gofumpt, go_revive },
				-- json = { fixjson },
				-- jsonc = { fixjson },
	-- 		},
	-- 	},
	-- })
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
