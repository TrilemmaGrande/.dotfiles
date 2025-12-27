local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  local map = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  map("n", "gd", vim.lsp.buf.declaration)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "<leader>rr", vim.lsp.buf.rename)
  map("n", "<leader>.", vim.lsp.buf.code_action)
  map("n", "[d", vim.diagnostic.goto_prev)
  map("n", "]d", vim.diagnostic.goto_next)
  map("n", "<leader>ld", vim.diagnostic.open_float)
  map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end)

  vim.api.nvim_echo({ { "LSP attached: " .. vim.bo.filetype, "ModeMsg" } }, false, {})
end

return M

