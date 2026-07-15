vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        if ev.data.spec.name == 'LuaSnip' and ev.data.kind ~= 'delete' then
            if not ev.data.active then vim.cmd.packadd('LuaSnip') end
            vim.fn.system({ 'make', '-C', vim.fn.stdpath('data') .. '/site/pack/core/opt/LuaSnip', 'install_jsregexp' })
        end
    end
})

vim.pack.add({
    'https://github.com/onsails/lspkind.nvim',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range('2.x') },
    'https://github.com/saadparwaiz1/cmp_luasnip',
    'https://github.com/hrsh7th/nvim-cmp',
})

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered({
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        }),
    },
})
