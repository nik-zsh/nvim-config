local M = {
	opts = { skip_confirm_for_simple_edits = true },
	{
		"-",
		function()
			vim.cmd("Oil")
		end,
		desc = "Oil file browser",
	},
	{
		"_",
		function()
			vim.cmd("write")
			-- require("oil").save({ confirm = false })
		end,
		desc = "write file operations",
	},
}

return M
