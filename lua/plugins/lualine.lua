return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local theme = require("lualine.themes.nightfly")
		theme.normal.c.bg = "None"
		theme.inactive.c.bg = "None"
        -- theme.insert.c.bg = "None"   --Uncomment these two if bg changes in insert and command mode
        -- theme.command.c.bg = "None"
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = theme, -- Or your preferred theme
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {
					},
					winbar = {},
				},
				ignore_statuslines = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 80,
					tabline = 80,
					winbar = 80,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "encoding", { "fileformat", symbols = { unix = "",}}, { "filetype" }
            },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "encoding", {"fileformat",
                symbols = {unix = ""}
            }, "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
