-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Formatter mapping
vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)


-- -- Diagnostics mappings
-- vim.keymap.set('n', '<leader>e', function() require('core.diagnostics').show_line_diagnostics() end, { desc = 'Show diagnostics for line', silent = true })
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic', silent = true })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic', silent = true })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics to loclist', silent = true })
-- vim.keymap.set('n', '<leader>Q', function() vim.diagnostic.setloclist({ open = true }) end, { desc = 'Populate and open loclist', silent = true })
