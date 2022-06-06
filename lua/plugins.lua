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
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex', 'elixir'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}

  -- Everforest
  use { 'sainnhe/everforest' } 
  

  -- Nvim Dashboard
  use { 'glepnir/dashboard-nvim' }

  -- Nvim tree
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', }, tag = 'nightly' } 

  -- COC
  use {'neoclide/coc.nvim', branch = 'release'}

  -- Tranparent Mode
  use { 'xiyaowong/nvim-transparent'}

  -- FloatTerm
  use { 'voldikss/vim-floaterm' } 

  -- Nunjucks Support
  use { 'glench/vim-jinja2-syntax'}

  -- Lualine
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- Git Gutter
  use {'airblade/vim-gitgutter'}

  -- Typing
  use {'alvan/vim-closetag'}
  use {'jiangmiao/auto-pairs'}


end)

