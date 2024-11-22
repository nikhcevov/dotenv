return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		name = "catppuccin",

		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				term_colors = true,
				integrations = {
					cmp = true,
					treesitter = true,
					mason = true,
					telescope = { enabled = true },
					gitsigns = true,
					indent_blankline = {
						colored_indent_levels = false,
						enabled = true,
					},
					native_lsp = {
						enabled = true,
						virtual_text = {
							information = { "italic" },
							warnings = { "italic" },
							errors = { "italic" },
							hints = { "italic" },
						},
						underlines = {
							information = { "underline" },
							warnings = { "underline" },
							errors = { "underline" },
							hints = { "underline" },
						},
					},
				},
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.25,
				},
			})

			vim.cmd("colorscheme catppuccin")
		end,
	},
	-- {
	-- 	"sonph/onehalf",
	-- 	config = function(plugin)
	-- 		vim.opt.rtp:append(plugin.dir .. "/vim")
	-- 		vim.cmd("colorscheme onehalflight")
	-- 	end,
	-- },
}
