return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = {"nvim-tree/nvim-web-devicons"},
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    keys = {
        {"<C-p>", function() vim.cmd([[FzfLua files]]) end, desc = "find files"},
        {
            "<leader>fg",
            function() vim.cmd([[FzfLua live_grep]]) end,
            desc = "grep"
        }
    },
    config = function()
        require('fzf-lua').setup({
            fzf_colors = {
                true, -- inherit fzf colors that aren't specified below from
                -- the auto-generated theme similar to `fzf_colors=true`
                ["fg"] = "-1",
                ["bg"] = "-1",
                ["hl"] = {"fg", "Comment"},
                ["fg+"] = {"fg", "Normal", "underline"},
                ["bg+"] = "-1",
                ["hl+"] = "-1",
                ["info"] = {"fg", "PreProc"},
                ["prompt"] = {"fg", "Conditional"},
                ["pointer"] = {"fg", "Exception"},
                ["marker"] = {"fg", "Keyword"},
                ["spinner"] = {"fg", "Label"},
                ["header"] = {"fg", "Comment"},
                ["gutter"] = "-1"
            }
        })
    end
}
