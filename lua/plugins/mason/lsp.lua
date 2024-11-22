return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local nvim_lsp = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        -- format on save
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end

      mason_lspconfig.setup_handlers({
        function(server)
          nvim_lsp[server].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          nvim_lsp["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = {
                  -- Tell the language server which version of Lua you're using
                  -- (most likely LuaJIT in the case of Neovim)
                  version = "LuaJIT",
                },
                diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = {
                    "vim",
                    "require",
                  },
                },
                workspace = {
                  -- Make the server aware of Neovim runtime files
                  library = vim.api.nvim_get_runtime_file("", true),
                },
              },
            },
          })
        end,
        ["ts_ls"] = function()
          nvim_lsp["ts_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        ["cssls"] = function()
          nvim_lsp["cssls"].setup({
            capabilities = capabilities,
          })
        end,
        ["tailwindcss"] = function()
          nvim_lsp["tailwindcss"].setup({
            capabilities = capabilities,
          })
        end,
        ["html"] = function()
          nvim_lsp["html"].setup({
            capabilities = capabilities,
          })
        end,
        ["jsonls"] = function()
          nvim_lsp["jsonls"].setup({
            capabilities = capabilities,
          })
        end,
        ["eslint"] = function()
          nvim_lsp["eslint"].setup({
            capabilities = capabilities,
          })
        end,
        ["graphql"] = function()
          nvim_lsp["graphql"].setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
}
