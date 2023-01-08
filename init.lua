local Plug = vim.fn['plug#']

require('linting')

vim.call('plug#begin')
Plug 'scrooloose/nerdtree'
Plug 'shaunsingh/solarized.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'mg979/vim-visual-multi'
Plug 'puremourning/vimspector'

-- iamcco/markdown-preview.nvim
Plug('iamcco/markdown-preview.nvim', {['do'] = vim.fn['cd app && yarn install']})

-- folke/trouble.nvim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

-- lsp plugins from lsp-zero
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'VonHeikemen/lsp-zero.nvim'
vim.call('plug#end')

vim.opt.ignorecase = true
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = 'unnamedplus'

-- lsp
require'lspconfig'.pyright.setup{}

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

require('colorscheme').setup()
require('statusline').setup()
require('keybindings').setup()
