-- local M = {}

-- -- Location information about the last message printed: {did_print, bufnr, lnum}
-- local last_echo = { false, -1, -1 }

-- -- Timer settings
-- local echo_timer = nil
-- local echo_timeout = 250

-- local warning_hlgroup = 'WarningMsg'
-- local error_hlgroup = 'ErrorMsg'
-- local short_line_limit = 20

-- local function get_cursor_line()
--     return vim.api.nvim_win_get_cursor(0)[1] - 1
-- end

-- local function echo_diagnostic()
--     if echo_timer and type(echo_timer.stop) == 'function' then
--         pcall(echo_timer.stop, echo_timer)
--     end

--     -- Use libuv timer to avoid returning a non-stopable handle on some versions
--     echo_timer = vim.loop.new_timer()
--     echo_timer:start(echo_timeout, 0, vim.schedule_wrap(function()
--         local bufnr = vim.api.nvim_get_current_buf()
--         local line = get_cursor_line()

--         if last_echo[1] and last_echo[2] == bufnr and last_echo[3] == line then
--             return
--         end

--         local diags = vim.diagnostic.get(bufnr, { lnum = line, severity = { min = vim.diagnostic.severity.WARN } })
--         if #diags == 0 then
--             if last_echo[1] then
--                 last_echo = { false, -1, -1 }
--                 pcall(vim.cmd, 'echo ""')
--             end
--             return
--         end

--         last_echo = { true, bufnr, line }
--         local diag = diags[1]

--         local lines = vim.split(diag.message, '\n')
--         local message = lines[1]
--         if #lines > 1 and #message <= short_line_limit then
--             message = message .. ' ' .. lines[2]
--         end

--         local width = vim.api.nvim_get_option('columns') - 15
--         if width > 0 and #message >= width then
--             message = message:sub(1, width) .. '...'
--         end

--         local hl = warning_hlgroup
--         if diag.severity == vim.diagnostic.severity.ERROR then
--             hl = error_hlgroup
--         end

--         local chunks = { { (diag.severity == vim.diagnostic.severity.ERROR and 'error: ' or 'warning: '), hl }, { message } }
--         vim.api.nvim_echo(chunks, false, {})
--     end))
-- end

-- local diag_augroup = vim.api.nvim_create_augroup('UserDiagnostics', { clear = true })
-- vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--     group = diag_augroup,
--     callback = function()
--         echo_diagnostic()
--     end,
-- })

-- -- Configure diagnostics display: keep signs, minimize virtual_text but keep prefix if desired
-- vim.diagnostic.config({
--     virtual_text = false,
--     signs = true,
--     underline = true,
--     severity_sort = true,
-- })

-- -- Helper to open a floating window for the current line (callable by mappings)
-- function M.show_line_diagnostics()
--     vim.diagnostic.open_float(nil, { scope = 'line', source = true })
-- end

-- -- Optional recommended mappings (not set here to avoid collisions):
-- -- nnoremap <leader>dn :lua require('core.diagnostics').show_line_diagnostics()<CR>
-- -- nnoremap <leader>dp :lua vim.diagnostic.goto_prev({ float = { source = true } })<CR>
-- -- nnoremap <leader>dn :lua vim.diagnostic.goto_next({ float = { source = true } })<CR>

-- return M
