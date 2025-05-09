return {
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = false,
            win_options = {
                signcolumn = "yes:2",
            },
        },
        -- Optional dependencies
        -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        keys = require("keys.oil"),
    },
    {
        "refractalize/oil-git-status.nvim",

        dependencies = {
            "stevearc/oil.nvim",
        },

        config = true,
    },
}
