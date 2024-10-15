return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lsp-signature-help",
		-- "hrsh7th/cmp-nvim-lsp-document-symbol",
		-- {
		-- 	"L3MON4D3/LuaSnip",
		-- 	version = "v2.*",
		-- 	-- install jsregexp (optional!).
		-- 	build = "make install_jsregexp",
		-- },
		-- "rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		-- local luasnip = require("luasnip")
		-- require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			performance = {
				max_view_entries = 10,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			-- snippet = {
			-- 	expand = function(args)
			-- 		luasnip.lsp_expand(args.body)
			-- 	end,
			-- },
			preselect = cmp.PreselectMode.None,
			mapping = cmp.mapping.preset.insert({
				-- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
				-- ["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				-- { name = "nvim_lsp_document_symbol" },
				-- { name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})

		vim.cmd([[
      set completeopt=menuone,noinsert,noselect
      highlight! default link CmpItemKind CmpItemMenuDefault
    ]])
	end,
}
