-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Clear search highlighting
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- -- Formatter mapping
-- vim.keymap.set('n', '<space>f', function()
--             vim.lsp.buf.format { async = true }
--         end)

-- -- Auto format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

