return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "jose-elias-alvarez/nvim-lsp-ts-utils" },
		-- keys = require("after.keys.lsp-keys"),
		opts = {
			diagnostoics = {
				virtual_text = false,
				virtual_lines = {
					only_current_line = true,
					highlight_whole_line = false,
				},
			},
		},
		keys = {
			{
				"]g",
				function()
					vim.diagnostic.jump({ count = 1, float = true })
				end,
				desc = "goto next err",
			},
			{
				"[g",
				function()
					vim.diagnostic.jump({ count = -1, float = true })
				end,
				desc = "Goto previous Hint/Error/Warning",
			},
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.diagnostic.config({
				-- virtual_text = false,
				severity_sort = true,
				float = {
					style = "minimal",
					border = "rounded",
					header = "",
					prefix = "",
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "»",
					},
				},
			})

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
			lspconfig.bashls.setup({})
			-- lspconfig.rust_analyzer.setup({
			-- settings = {
			-- ["rust-analyzer"] = {
			-- diagnostics = {
			-- enable = true,
			-- },
			-- },
			-- },
			-- })
			-- vim.diagnostic.config({
			--     underline = true,
			--     virtual_text = true,
			--     severity_sort = true
			-- })
			lspconfig.clangd.setup({ capabilities = capabilities })
			-- lspconfig.ccls.setup({capabilities = capabilities})
			-- lspconfig.ccls.setup({})
			-- lspconfig.vimls.setup({})
			-- lspconfig.html.setup({})
			-- lspconfig.ccls.setup({})
			-- lspconfig.emmet_language_server.setup({})
			lspconfig.ts_ls.setup({
				-- init_options = {
				--   preferences = {
				--     disableSuggestions = false,
				--   },
				-- },
				-- the module used in on_attach is not updated anymore then if you
				-- see any pesky errors remove the following block of code
				on_attach = function(client, bufnr)
					require("nvim-lsp-ts-utils").setup({
						filter_out_diagnostics_by_code = { 80001 },
					})
					require("nvim-lsp-ts-utils").setup_client(client)
				end,
			})

			-- lspconfig.emmet_ls.setup({
			-- 	filetypes = { "html", "ejs" },
			-- })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
