return {
    priority = 1110000,
    "rcarriga/nvim-notify",
    opts = {background_color = "#000000"},
    config = function()
        local notify = require("notify")
        ---@diagnostic disable-next-line: missing-fields
        require("notify").setup()
        -- notify("Ram Ram Malik")
        notify.history()
        vim.notify = require("notify")
    end
}
