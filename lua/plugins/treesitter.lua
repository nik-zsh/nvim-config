return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        ---@diagnostic disable-next-line: missing-fields
        config.setup({
            filesystem = {filtered_items = {visible = true}},
            auto_install = true,
            highlight = {enable = true},
            ---@diagnostic disable-next-line: undefined-global
            indent = {enable = true1}
        })
    end
}
