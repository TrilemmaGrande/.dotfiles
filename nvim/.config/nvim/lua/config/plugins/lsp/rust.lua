return {
    {
        "Saecki/crates.nvim",
        ft = { "toml" },
        event = { "BufRead Cargo.toml" },
        opts = {
            completion = { crates = { enabled = true } },
            lsp = { enabled = true, actions = true, completion = true, hover = true },
        },
    },

    {
        "mrcjkb/rustaceanvim",
        ft = { "rust" },
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            local rustup_bin = vim.fn.expand("/usr/lib/rustup/bin/rust-analyzer")
            vim.g.rustaceanvim = {
                server = {
                    cmd = { rustup_bin },
                    on_attach = function(client, bufnr)
                        local lsp = require("config.lsp")
                        lsp.on_attach(client, bufnr)

                        local map = function(mode, lhs, rhs)
                            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
                        end

                        map("n", "<leader>re", function() vim.cmd.RustLsp("runnables") end)
                        map("n", "<leader>rd", function() vim.cmd.RustLsp("debuggables") end)
                        map("n", "<leader>rm", function() vim.cmd.RustLsp("expandMacro") end)
                        map("n", "<leader>rh", function() vim.cmd.RustLsp("toggleInlayHints") end)
                    end,
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = { allFeatures = true },
                            checkOnSave = { enable = true, command = "clippy" },
                            procMacro = { enable = true },
                        },
                    },
                },
            }
        end,
    },

    {
        "mfussenegger/nvim-dap",
        ft = "rust",
        config = function()
            local dap = require("dap")
            local mason_registry = require("mason-registry")
            local codelldb = mason_registry.get_package("codelldb")
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = codelldb_path,
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.rust = {
                {
                    name = "Launch Rust program",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
        end,
    },
}
