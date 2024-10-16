vim.o.background = "light"

return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	-- name = "catppuccin",

	config = function()
		require("vscode").setup()
		-- require("catppuccin").setup({
		-- 	flavour = "latte",
		-- 	no_italic = true,
		-- 	term_colors = true,
		-- 	integrations = {
		-- 		cmp = true,
		-- 		treesitter = true,
		-- 		mason = true,
		-- 		telescope = { enabled = true },
		-- 	},
		-- 	dim_inactive = {
		-- 		enabled = true, -- dims the background color of inactive window
		-- 		shade = "dark",
		-- 		percentage = 0.25, -- percentage of the shade to apply to the inactive window
		-- 	},
		-- })

		vim.cmd("colorscheme vscode")
	end,
}
