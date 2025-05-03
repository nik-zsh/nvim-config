return {
    priority = 11000,
    "xiyaowong/transparent.nvim",
    config = function()
        -- Optional, you don't have to run setup.
        require("transparent").setup({
            require("transparent").clear_prefix("Telescope")
        })
    end
}
