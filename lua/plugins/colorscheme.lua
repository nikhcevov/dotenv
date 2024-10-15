return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catppuccin",

	config = function()
		local theme = require("catppuccin")
		theme.setup({
			no_italic = true,
			term_colors = true,
			transparent_background = false,
			integrations = {
				cmp = true,
				treesitter = true,
				mason = true,
				telescope = { enabled = true },
			},
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.25, -- percentage of the shade to apply to the inactive window
			},
		})
		vim.cmd("colorscheme catppuccin-mocha")
	end,
}
