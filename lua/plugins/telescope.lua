return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			extensions = {
				file_browser = {
					-- theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					-- mappings = {
					-- 	["i"] = {
					-- 		-- your custom insert mode mappings
					-- 	},
					-- 	["n"] = {
					-- 		-- your custom normal mode mappings
					-- 	},
					-- },
				},
			},
		})

		telescope.load_extension("file_browser")

		vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "Open file explorer" })
		vim.keymap.set(
			"n",
			"<leader>fE",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "Open file explorer with current buffer path" }
		)
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
		vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })
	end,
}
