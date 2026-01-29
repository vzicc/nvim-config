-- local M = {}

-- require("lazy").setup({
--     { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
--     "tpope/vim-commentary",
--     "tpope/vim-fugitive",
--     "tpope/vim-surround",
--     -- "mattn/emmet-vim",
--     "nvim-tree/nvim-tree.lua",
--     "nvim-tree/nvim-web-devicons",
--     "ellisonleao/gruvbox.nvim",
--     "nvim-lualine/lualine.nvim",
--     -- "dracula/vim",
--     "nvim-treesitter/nvim-treesitter",
--     -- "vim-test/vim-test",
--     -- "lewis6991/gitsigns.nvim",
--     -- "preservim/vimux",
--     -- "christoomey/vim-tmux-navigator",
--     "stevearc/oil.nvim",
--     --
--     -- completion
--     "hrsh7th/nvim-cmp",
--     "hrsh7th/cmp-nvim-lsp",
--     "L3MON4D3/LuaSnip",
--     "saadparwaiz1/cmp_luasnip",
--     "rafamadriz/friendly-snippets",
--     "github/copilot.vim",
--     --
--     -- LSP STUFF --------
--     "williamboman/mason.nvim",
--     "williamboman/mason-lspconfig.nvim",
--     "neovim/nvim-lspconfig",
--     {
--         "mason-org/mason.nvim",
--         opts = {}
--     },
--     -- fixers
--     "jose-elias-alvarez/null-ls.nvim",
--     {
--         "jay-babu/mason-null-ls.nvim",
--         event = { "BufReadPre", "BufNewFile" },
--         dependencies = {
--             "williamboman/mason.nvim",
--             "nvimtools/none-ls.nvim",
--         },
--         config = function()
--             require("plugins.configs.nullLS_config")
--         end,
--     },
--     -- {
--     --   "vinnymeller/swagger-preview.nvim",
--     --   run = "npm install -g swagger-ui-watcher",
--     -- },
--     -- {
--     --   "iamcco/markdown-preview.nvim",
--     --   run = "cd app && npm install",
--     -- },
--     {
--         "nvim-telescope/telescope.nvim",
--         tag = "0.1.4",
--         dependencies = { "nvim-lua/plenary.nvim" }
--     },
-- })

-- -- load plugin configs
-- require("plugins.configs.catppuccin")
-- require("plugins.configs.lualine")
-- require("plugins.configs.nvim-tree")
-- require("plugins.configs.telescope")
-- require("plugins.configs.treesitter")
-- -- require("plugins.configs.lsp_config")
-- require("plugins.configs.completions")
-- require("plugins.configs.oil_config")

-- return M

return {
    -- ==============================
    -- THEME & UI
    -- ==============================
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function() require("plugins.configs.catppuccin") end
    },
    "ellisonleao/gruvbox.nvim",

    -- Status Line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("plugins.configs.lualine") end
    },

    -- ==============================
    -- NAVIGATION & EDITING
    -- ==============================
    "tpope/vim-commentary",
    "tpope/vim-fugitive",
    "tpope/vim-surround",

    -- File Explorer (NvimTree)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("plugins.configs.nvim-tree") end
    },

    -- File Editor (Oil)
    {
        "stevearc/oil.nvim",
        config = function() require("plugins.configs.oil_config") end
    },

    -- Fuzzy Finder (Telescope)
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("plugins.configs.telescope") end
    },

    -- Syntax Highlighting (Treesitter)
    {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("plugins.configs.treesitter") end
    },

    -- ==============================
    -- LSP & COMPLETION
    -- ==============================

    -- The LSP Engine
    -- (Configuration is handled in core.lsp file)
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- Needed to link LSP to CMP
    },

    -- Autocompletion Engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "github/copilot.vim",
        },
        config = function() require("plugins.configs.completions") end
    },

    -- ==============================
    -- TOOLS & FORMATTING
    -- ==============================

    -- Mason (Installer for formatters/linters)
    { "mason-org/mason.nvim", opts = {} },

    -- Null-LS (Formatters)
    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "jay-babu/mason-null-ls.nvim",
    --     },
    --     config = function() require("plugins.configs.nullLS_config") end
    -- },

    -- -- Markdown Preview
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     ft = { "markdown" },
    --     build = function() vim.fn["mkdp#util#install"]() end,
    -- },
}
