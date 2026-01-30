return {
    -- ==============================
    -- THEME & UI
    -- ==============================
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function() require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                integrations = {
                    telescope = true,
                    lualine = false,
                    treesitter = true,
                }
            })

            -- Actually apply the colorscheme
            vim.cmd.colorscheme "catppuccin"
        end
    },

    -- Status Line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    theme = 'catppuccin', -- matches your theme
                },
                sections = {
                    lualine_a = {
                        { 'filename', path = 1 } -- 1 = relative path
                    }
                }
            })
        end
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
        config = function()
            require("nvim-tree").setup()
            vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
        end
    },

    -- File Editor (Oil)
    {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
        end
    },

    -- Fuzzy Finder (Telescope)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = { "node%_modules/.*" }
                }
            })

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<c-p>', builtin.find_files, {})
            vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
            vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
        end
    },

    -- Syntax Highlighting (Treesitter)
    {
        -- "nvim-treesitter/nvim-treesitter",
        -- config = function() require("plugins.configs.treesitter") end
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "python", "java", "vim", "html" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                rainbow = { enable = true, extended_mode = true }
            })
        end
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
        },
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-o>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                }),
            })
        end
    },

    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })

            -- Toggle Copilot (<leader>cp)
            vim.keymap.set('n', '<leader>cp', function()
                if vim.g.copilot_enabled == 0 then
                    vim.g.copilot_enabled = 1
                    print("🤖 Copilot Enabled")
                else
                    vim.g.copilot_enabled = 0
                    print("🤖 Copilot Disabled")
                end
            end, { desc = "Toggle Copilot" })
        end
    },

    -- ==============================
    -- TOOLS & FORMATTING
    -- ==============================

    -- Mason (Installer for formatters/linters)
    { "mason-org/mason.nvim", opts = {} },

}
