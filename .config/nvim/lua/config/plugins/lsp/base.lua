return {
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
                ensure_installed = {
                    "pyright",
                    "lua_ls",
                    "html",
                    "emmet_ls",
                    "ts_ls"
                },
                automatic_installation = true,
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lsp = require("config.lsp")

            -- Lua
            vim.lsp.config.lua_ls = {
                on_attach = lsp.on_attach,
                capabilities = lsp.capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            }

            -- Python
            vim.lsp.config.pyright = {
                on_attach = lsp.on_attach,
                capabilities = lsp.capabilities,
            }

            -- 🔹 HTML
            vim.lsp.config.html = {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            -- 🔹 Emmet
            vim.lsp.config.emmet_ls = {
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = {
                    "html",
                    "typescriptreact",
                    "javascriptreact",
                    "css",
                    "sass",
                    "scss",
                    "less",
                },
            }

            -- 🔹 Jetzt aktivieren wir sie explizit
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("pyright")
            vim.lsp.enable("html")
            vim.lsp.enable("emmet_ls")
        end,
    },
}
