-- Central theme module: set GUI colors and apply overrides after a colorscheme loads
local M = {}

vim.opt.termguicolors = true

local function apply_overrides()
	pcall(vim.cmd, "highlight Comment ctermfg=LightBlue guifg=#008080")
end

local grp = vim.api.nvim_create_augroup('UserThemeOverrides', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
	group = grp,
	callback = apply_overrides,
})

-- Apply immediately if a colorscheme is already active
apply_overrides()

return M
