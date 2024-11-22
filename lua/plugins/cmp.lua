return {
	"llllvvuu/nvim-cmp",
	event = "InsertEnter",
	branch = "feat/above",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"onsails/lspkind.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		cmp.setup({
			view = {
				entries = { name = "custom", selection_order = "near_cursor", vertical_positioning = "above" },
			},
			experimental = {
				-- TODO: Ghost text is conflicting with other virtual text providers like ai autocomplete
				-- ghost_text = true,
			},
			performance = {
				-- max_view_entries = 10,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			mapping = cmp.mapping.preset.insert({
				-- TODO: Solve conflicts
				-- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-p>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-n>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 10 },
				{ name = "nvim_lsp_signature_help", priority = 9 },
				{ name = "buffer", priority = 7, max_item_count = 10 },
				{ name = "path", priority = 6 },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})
	end,
}
