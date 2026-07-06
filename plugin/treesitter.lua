vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind ~= 'delete' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

-- Install parsers
local parsers = {
    "markdown", "markdown_inline", "json", "javascript", "typescript",
    "yaml", "html", "css", "bash", "lua", "dockerfile", "gitignore",
    "python", "vue", "go",
}

local installed = require("nvim-treesitter").get_installed()
local to_install = vim.tbl_filter(function(p)
    return not vim.list_contains(installed, p)
end, parsers)

if #to_install > 0 then
    require("nvim-treesitter").install(to_install)
end

-- Enable highlighting and indentation for all filetypes with parsers
vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        if pcall(vim.treesitter.start) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
