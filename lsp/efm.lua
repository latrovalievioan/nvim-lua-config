---@brief
---
--- https://github.com/mattn/efm-langserver
---
--- General-purpose language server that wraps CLI tools. Used here to expose
--- prettier as an LSP formatter, so `vim.lsp.buf.format()` works natively.

local prettier = {
  formatCommand = 'prettier --stdin-filepath ${INPUT}',
  formatStdin = true,
}

local languages = {
  javascript = { prettier },
  javascriptreact = { prettier },
  ['javascript.jsx'] = { prettier },
  typescript = { prettier },
  typescriptreact = { prettier },
  ['typescript.tsx'] = { prettier },
  json = { prettier },
  jsonc = { prettier },
  css = { prettier },
  scss = { prettier },
  less = { prettier },
  html = { prettier },
  yaml = { prettier },
  markdown = { prettier },
  graphql = { prettier },
}

---@type vim.lsp.Config
return {
  cmd = { 'efm-langserver' },
  filetypes = vim.tbl_keys(languages),
  root_markers = { 'package.json', '.git' },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
  settings = {
    rootMarkers = { 'package.json', '.git/' },
    languages = languages,
  },
}
