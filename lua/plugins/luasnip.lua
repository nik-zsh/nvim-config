return {
    "L3MON4D3/LuaSnip",
    keys = {
        {
            "<C-K",
            function() require("luasnip").expand() end,
            desc = "expand snippet",
            mode = {"i"}
        }
    }
}
