local mapkey = require("util.keymapper").mapkey

local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	if client.name == "pyright" then
		mapkey("<Leader>oi", "PyrightOrganizeImports", "n", opts)
	end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
