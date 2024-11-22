return {
	"mikesmithgh/borderline.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	enabled = true,
	lazy = true,
	event = "VeryLazy",
	config = function()
		local bl_borders = require("borderline.borders")
		require("borderline").setup({
			enabled = true,
			-- Read source https://github.com/mikesmithgh/borderline.nvim/blob/main/lua/borderline/borders.lua
			border = bl_borders.double,
		})
	end,
}
