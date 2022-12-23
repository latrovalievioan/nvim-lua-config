local opt = vim.opt -- for conciseness

--line numbers
opt.number = true

-- tabs & identation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
-- vim.g.nightflyTransparent = true
vim.g.moonflyCursorColor = true
vim.g.moonflyTransparent = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- - counts towards the word now
opt.iskeyword:append("-")

-- scrolloff
opt.scrolloff = 8

-- title of buffer
opt.title = true

-- white spaces as chars
opt.list = true
opt.listchars = { tab = '>~', space = '·', trail = '·' }
