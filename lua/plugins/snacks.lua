return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        picker = {
            -- your picker configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        indent = {
            -- your indent configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        scroll = {
            -- your scroll configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        statuscolumn = {
            -- your statuscolumn configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            -- enabled = true,
            left = { "mark", "sign" }, -- priority of signs on the left
            right = { "fold", "git" }, -- priority of signs on the right
            folds = {
                open = true,   -- show open fold icons
                git_hl = false, -- use git sign hl for fold icons
            },
            git = {
                patterns = { "GitSign", "MiniDiffSign" },
            },
            refresh = 50, -- refresh at most every 50ms
        }
    },
    priority = 1000,
    lazy = false,
    keys = {
        { "<leader>ff", function() Snacks.picker.smart() end,                desc = "Smart Find Files" },
        { "<leader>fb", function() Snacks.picker.buffers() end,              desc = "Buffers" },
        { "<leader>fw", function() Snacks.picker.grep() end,                 desc = "Grep" },
        { "<leader>fs", function() Snacks.picker.git_status() end,           desc = "Git Status" },

        { "gd",         function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,       nowait = true,                  desc = "References" },
        { "gi",         function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
        { "gt",         function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },

        { "<leader>fW", function()
            local dir = vim.fn.input("Directory: ", vim.fn.getcwd(), "dir")
            if dir ~= "" then
                Snacks.picker.grep({ cwd = dir })
            end
        end, { desc = "Grep in chosen directory" } }
    }
}
