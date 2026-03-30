return {
  -- Git signs
  { "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, config = true },

  -- Git CLI
  { "tpope/vim-fugitive", cmd = { "Git", "Gdiffsplit", "Gcommit" } },

  -- Trouble: LSP Diagnostics
  { "folke/trouble.nvim", cmd = { "Trouble", "TroubleToggle" }, dependencies = { "nvim-tree/nvim-web-devicons" }, opts = { use_diagnostic_signs = true } },

  -- Terminal
  { "akinsho/toggleterm.nvim", version = "*", cmd = "ToggleTerm", config = true },

  -- Task Runner
  { "stevearc/overseer.nvim", cmd = { "OverseerRun", "OverseerToggle" }, config = true },

  -- Debugging
  { "mfussenegger/nvim-dap", config = function() end, dependencies = { "rcarriga/nvim-dap-ui" }, config = true },

  -- LSP progress
  { "j-hui/fidget.nvim", event = "LspAttach", config = true },
}

