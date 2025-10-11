return {
  -- Telescope (Fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git", "target" },
          mappings = {
            i = { ["<esc>"] = require("telescope.actions").close },
          },
        },
      })
      local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git files" })
    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Telescope grep string" })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "rust", "toml", "json", "python", "bash" },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = { enable = true },
      })
    end,
  },

  -- CMP Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" }, { name = "path" } }),
      })
    end,
  },

  -- Autopairs
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  -- Comments
  { "numToStr/Comment.nvim", keys = { "gc", "gcc" }, config = true },

  -- Surround
  { "tpope/vim-surround", event = "VeryLazy" },
}

