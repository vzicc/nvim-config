-- Catppuccin theme configuration
local ok, catppuccin = pcall(require, 'catppuccin')
if not ok then
  -- plugin may not be installed yet; graceful fallback
  return
end

catppuccin.setup({
  flavour = 'mocha', -- 'latte', 'frappe', 'macchiato', 'mocha'
  integrations = {
    telescope = true,
    lualine = false,
    treesitter = true,
  },
})

vim.cmd('colorscheme catppuccin')
