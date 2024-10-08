require("lazy").setup({
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  -- "mattn/emmet-vim",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "ellisonleao/gruvbox.nvim",
  "nvim-lualine/lualine.nvim",
  -- "dracula/vim",
  "nvim-treesitter/nvim-treesitter",
  -- "vim-test/vim-test",
  -- "lewis6991/gitsigns.nvim",
  -- "preservim/vimux",
  -- "christoomey/vim-tmux-navigator",
  "stevearc/oil.nvim",
  --
  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  -- "github/copilot.vim",
  --
  -- LSP STUFF --------
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  -- fixers
  "jose-elias-alvarez/null-ls.nvim",
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("core.plugin_config.nullLS_config")
    end,
  },
  -- {
  --   "vinnymeller/swagger-preview.nvim",
  --   run = "npm install -g swagger-ui-watcher",
  -- },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   run = "cd app && npm install",
  -- },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
})
