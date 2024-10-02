-- Location information about the last message printed. The format is
-- `(did print, buffer number, line number)`.
local last_echo = { false, -1, -1 }

-- The timer used for displaying a diagnostic in the commandline.
local echo_timer = nil

-- The timer after which to display a diagnostic in the commandline.
local echo_timeout = 250

-- The highlight group to use for warning messages.
local warning_hlgroup = 'WarningMsg'

-- The highlight group to use for error messages.
local error_hlgroup = 'ErrorMsg'

-- If the first diagnostic line has fewer than this many characters, also add
-- the second line to it.
local short_line_limit = 20

-- Shows the current line's diagnostics in a floating window.
-- function show_line_diagnostics()
--     vim.lsp.diagnostic.show_line_diagnostics({ min = vim.diagnostic.severity.WARNING }, vim.fn.bufnr(''))
-- end
function show_line_diagnostics()
    vim.diagnostic.open_float(nil, {
        scope = "line",
        severity = { min = vim.diagnostic.severity.WARNING }
    })
end

-- Prints the first diagnostic for the current line.
function echo_diagnostic()
    if echo_timer then
        echo_timer:stop()
    end

    echo_timer = vim.defer_fn(
        function()
            local line = vim.fn.line('.') - 1
            local bufnr = vim.api.nvim_win_get_buf(0)

            if last_echo[1] and last_echo[2] == bufnr and last_echo[3] == line then
                return
            end

            local diags = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line, { min = vim.diagnostic.severity.WARNING })

            if #diags == 0 then
                -- If we previously echoed a message, clear it out by echoing an empty message.
                if last_echo[1] then
                    last_echo = { false, -1, -1 }
                    vim.api.nvim_command('echo ""')
                end
                return
            end

            last_echo = { true, bufnr, line }

            local diag = diags[1]
            local width = vim.api.nvim_get_option('columns') - 15
            local lines = vim.split(diag.message, "\n")
            local message = lines[1]
            local trimmed = false

            if #lines > 1 and #message <= short_line_limit then
                message = message .. ' ' .. lines[2]
            end

            if width > 0 and #message >= width then
                message = message:sub(1, width) .. '...'
            end

            local kind = 'warning'
            local hlgroup = warning_hlgroup

            if diag.severity == vim.lsp.protocol.DiagnosticSeverity.Error then
                kind = 'error'
                hlgroup = error_hlgroup
            end

            local chunks = {
                { kind .. ': ', hlgroup },
                { message }
            }

            vim.api.nvim_echo(chunks, false, {})
        end,
        echo_timeout
    )
end

-- Correct way to create the autocommand in Lua
vim.api.nvim_create_autocmd('CursorMoved', {
    callback = function()
        echo_diagnostic() -- Call your custom Lua function here
    end,
})

-- Change virtual text to just the square
vim.diagnostic.config({
    virtual_text = { format = function(d) return "" end },
    signs = true
})

-- nnoremap <c-j> <cmd>lua vim.diagnostic.goto_next({float={source=true}})<cr>
-- nnoremap <c-k> <cmd>lua vim.diagnostic.goto_prev({float={source=true}})<cr>
