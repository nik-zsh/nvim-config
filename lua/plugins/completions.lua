return {
    { "hrsh7th/cmp-nvim-lsp" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-path", "rcarriga/cmp-dap" },
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            local function is_dap_available()
                local dap_ok, dap = pcall(require, "dap")
                return dap_ok and dap and dap.is_initialized ~= nil and dap.is_initialized()
            end

            cmp.setup({
                enabled = function()
                    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" and is_dap_available()
                end,
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "dap" },
                }, { { name = "buffer" } }),
            })

            -- Optional: Specific sources for DAP-related filetypes
            cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
                sources = { { name = "dap" } },
            })
        end,
    },
}
