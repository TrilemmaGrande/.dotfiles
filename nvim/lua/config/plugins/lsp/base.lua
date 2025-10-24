return {
    -- Mason für LSP + DAP
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        config = true,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "lua_ls","rust_analyzer" },
                automatic_installation = true,
            })
        end,
    },

    {
        "williamboman/mason-nvim-dap.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb" },
                automatic_installation = true,
            })
        end,
    },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
        end

        -- Standard-LSP-Keymaps
        map("n", "gd", vim.lsp.buf.declaration)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<leader>rr", vim.lsp.buf.rename)
        map("n", "<leader>.", vim.lsp.buf.code_action)
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
        map("n", "<leader>d", vim.diagnostic.open_float)
      end

      -- Lua Language Server
      vim.lsp.config['lua_ls'] = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      }

      -- Python (Pyright)
      vim.lsp.config['pyright'] = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
  },
}
