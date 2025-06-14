require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "tsserver" }, 
  automatic_installation = true,
})

local lspconfig = require("lspconfig")

lspconfig.pyright.setup {}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" } 
      }
    }
  }
}

