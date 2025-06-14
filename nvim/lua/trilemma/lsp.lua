require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "basedpyright", "lua_ls", "rust_analyzer" },
  automatic_installation = true,
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python (basedpyright)
lspconfig.basedpyright.setup({
  capabilities = capabilities,
})

-- Lua
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- Rust
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
})


