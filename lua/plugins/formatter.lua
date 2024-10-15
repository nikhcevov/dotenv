return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>ft",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			javascript = { "eslint_d", "prettierd", stop_after_first = true },
			typescript = { "eslint_d", "prettierd", stop_after_first = true },
			javascriptreact = { "eslint_d", "prettierd", stop_after_first = true },
			typescriptreact = { "eslint_d", "prettierd", stop_after_first = true },
			lua = { "stylua" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 1000,
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
