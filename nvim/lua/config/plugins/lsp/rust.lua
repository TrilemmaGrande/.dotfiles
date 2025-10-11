return {
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = { "nvim-lspconfig" },
        config = function()
            local globals = require("config.plugins.lsp._globals")
            require("rust-tools").setup({ server = { on_attach = globals.on_attach, capabilities = globals.capabilities } })
        end
    },
    { "saecki/crates.nvim", event = { "BufRead Cargo.toml" }, config = function() require("crates").setup() end },
}
