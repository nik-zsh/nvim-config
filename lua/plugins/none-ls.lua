-- local require("null-ls") = require("null-ls")
return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim", "nik-zsh/nuke-ls", "davidmh/cspell.nvim" },
	opts = function(_, opts)
		local cspell = require("cspell")
		opts.sources = opts.sources or {}
		table.insert(
			opts.sources,
			cspell.diagnostics.with({
				diagnostics_postprocess = function(diagnostic)
					diagnostic.severity = vim.diagnostic.severity.HINT
				end,
			})
		)
		table.insert(opts.sources, cspell.code_actions)
	end,
	config = function()
		require("null-ls").setup({
			sources = {
				require("null-ls").builtins.formatting.stylua,
				require("null-ls").builtins.diagnostics.cppcheck,
				require("null-ls").builtins.formatting.markdownlint,
				require("cspell").diagnostics.with({
					filetypes = { "c", "cpp" },
				}),
				require("cspell").code_actions.with({
					filetypes = { "c", "cpp" },
				}),
				require("null-ls").builtins.formatting.clang_format,
				require("null-ls").builtins.formatting.cmake_format,
				-- require("cspell").code_actions,
				-- require("cspell").diagnostics,
			},
			-- sources = require("none-ls.sources"),
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
