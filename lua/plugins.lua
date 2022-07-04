local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex', 'elixir', 'nunjucks', 'jinja2'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
  -- LSP
  use {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp'
  }

  -- LSP Saga
  use { 'glepnir/lspsaga.nvim', branch = 'main'}

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}

  -- Tranparent Mode
  use { 'xiyaowong/nvim-transparent'}

  -- FloatTerm
  use { 'voldikss/vim-floaterm' }

  -- Lualine
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- Git Gutter
  use {'airblade/vim-gitgutter'}

  -- Typing
  use {'alvan/vim-closetag'}
  use {'jiangmiao/auto-pairs'}

  -- Prettier
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }

  -- Colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }

  -- NvimTree
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', }, tag = 'nightly' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter'}

  -- Lua Dev
  use { 'folke/lua-dev.nvim' }

end)


