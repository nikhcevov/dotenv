return {
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	event = "BufEnter",
	-- 	config = function()
	-- 		require("supermaven-nvim").setup({
	-- 			keymaps = {
	-- 				accept_suggestion = "<Tab>",
	-- 				clear_suggestion = "<C-]>",
	-- 				accept_word = "<C-j>",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			-- vim.g.codeium_disabled = 0
		end,
	},
}
