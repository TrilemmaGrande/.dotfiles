local opts = { noremap = true, silent = true }

-- Go to definition: Ctrl+F12
vim.keymap.set("n", "<C-F12>", vim.lsp.buf.definition, opts)

-- Back: Ctrl + -
vim.keymap.set("n", "<C-->", vim.lsp.buf.references, opts) -- oder <C-o> für jump list

-- Context menu (Code Actions): Ctrl + .
vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action, opts)
vim.keymap.set("v", "<C-.>", vim.lsp.buf.code_action, opts)

-- Rename symbol (all occurrences): Ctrl + rr
vim.keymap.set("n", "<C-r><C-r>", vim.lsp.buf.rename, opts)
