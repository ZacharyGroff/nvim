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

-- nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter'

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

-- treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "help", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- lukas-reineke/indent-blankline.nvim
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

require('colorscheme').setup()
require('statusline').setup()
require('keybindings').setup()
