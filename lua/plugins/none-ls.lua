return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim", "nik-zsh/nuke-ls" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.markdownlint,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.cmake_format,
                -- null_ls.builtins.formatting.prettierd
                -- require("nuke-ls.builtins.formatting.lua_format"),
                -- null_ls.builtins.formatting.lua_format
                -- null_ls.builtins.diagnostics.erb_lint,
            }
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end
}
