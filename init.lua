local Plug = vim.fn['plug#']

require('linting')

vim.call('plug#begin')
Plug 'scrooloose/nerdtree'
Plug 'shaunsingh/solarized.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'mg979/vim-visual-multi'
Plug 'puremourning/vimspector'

-- lukas-reineke/indent-blankline.nvim
Plug 'lukas-reineke/indent-blankline.nvim'

-- tpope/vim-fugitive
Plug 'tpope/vim-fugitive'


-- nvim-telescope/telescope
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.1' })

-- ThePrimeagen/harpoon
-- Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

-- nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter'

-- iamcco/markdown-preview.nvim
Plug('iamcco/markdown-preview.nvim', {['do'] = vim.fn['cd app && yarn install']})

-- folke/trouble.nvim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

-- L3MON4D3/LuaSnip
Plug 'L3MON4D3/LuaSnip'

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
Plug 'rafamadriz/friendly-snippets'
Plug 'VonHeikemen/lsp-zero.nvim'
vim.call('plug#end')

vim.g.mapleader = "="
vim.opt.ignorecase = true
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = 'unnamedplus'
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent= true
vim.opt.scrolloff = 8

-- lsp
require'lspconfig'.pyright.setup{}

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)
lsp.setup()

-- treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "vim", "help", "python", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- L3MON4D3/LuaSnip
local ls = require("luasnip")
require("luasnip.loaders.from_snipmate").load({ path = { "~/.config/nvim/snippets" } })
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

-- lukas-reineke/indent-blankline.nvim
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

require('colorscheme').setup()
require('statusline').setup()
require('keybindings').setup()
