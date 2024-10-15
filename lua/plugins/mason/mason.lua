return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-tool-installer").setup({
			integrations = {
				["mason-lspconfig"] = true,
			},
			ensure_installed = {
				-- mason
				"prettierd",
				"stylua",
				"eslint_d",
				-- mason-lspconfig
				"lua_ls",
				"cssls",
				"eslint",
				"html",
				"jsonls",
				"ts_ls",
				"tailwindcss",
				"graphql",
			},
		})
	end,
}
