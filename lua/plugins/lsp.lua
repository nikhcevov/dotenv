return {
	{
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
					"prettier",
					"stylua",
					-- mason-lspconfig
					"vtsls",
					"lua_ls",
					"cssls",
					"eslint",
					"html",
					"jsonls",
					"tailwindcss",
					"graphql",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local nvim_lsp = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
				nvim_lsp[server].setup({
					-- on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end,
	},
}
