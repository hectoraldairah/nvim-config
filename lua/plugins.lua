local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Needed to load first
  use { 'lewis6991/impatient.nvim' }
  use { 'nathom/filetype.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }

  -- Colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }
  use "EdenEast/nightfox.nvim" -- Packer
  use "rebelot/kanagawa.nvim"

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', config = "require('plugins.treesitter')" }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
  use { 'RRethy/nvim-treesitter-textsubjects', after = { 'nvim-treesitter' } }
  use { 'm-demare/hlargs.nvim', config = function() require('hlargs').setup() end }
  use { 'nvim-pack/nvim-spectre' }

  -- Navigating (Telescope/Tree/Refactor)
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope.nvim',
    config = "require('plugins/telescope')",
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim' }
    }
  }
  use { 'cljoly/telescope-repo.nvim' }
  use { 'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')" }
  use { 'gbprod/stay-in-place.nvim',
    config = function()
      require('stay-in-place').setup({})
    end
  }
  use { 'akinsho/bufferline.nvim', tag = "v2.*" }
  -- LSP Base
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'neovim/nvim-lspconfig' }

  -- LSP Cmp
  use { 'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')" }
  use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
  use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
  use { 'hrsh7th/cmp-cmdline', after = 'cmp-path' }
  use { 'saadparwaiz1/cmp_luasnip', after = 'cmp-cmdline' }

  -- LSP Addons
  use { 'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = "require('plugins.dressing')" }

  -- Snippets & Language & Syntax
  use { 'windwp/nvim-autopairs', after = { 'nvim-treesitter', 'nvim-cmp' }, config = "require('plugins.autopairs')" }
  use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } }
  use { 'lukas-reineke/indent-blankline.nvim', config = "require('plugins.indent')" }
  use { 'NvChad/nvim-colorizer.lua', config = "require('plugins.colorizer')" }
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, after = 'cmp_luasnip' }

  -- General
  use { 'voldikss/vim-floaterm' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = "require('plugins.lualine')" }
  use { "folke/zen-mode.nvim", config = "require('plugins.zen')" }
  use { 'folke/twilight.nvim', config = "require('plugins.twilight')" }
  use { "xiyaowong/nvim-transparent", config = "require('plugins.transparent')" }
  use { 'echasnovski/mini.nvim', config = "require('plugins.mini')" }

end)
