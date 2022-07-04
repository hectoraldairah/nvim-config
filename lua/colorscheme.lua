
local theme_opts = {
  catppuccin_flavour = 'mocha'
} 

vim.cmd('colorscheme catppuccin')

for k, v in pairs(theme_opts) do
  vim.g[k] = v
end
