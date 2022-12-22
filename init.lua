local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'scrooloose/nerdtree'
Plug 'shaunsingh/solarized.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'mg979/vim-visual-multi'
Plug 'puremourning/vimspector'

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

-- colorscheme
vim.cmd('set termguicolors')
vim.cmd('set background=light')
vim.cmd('colorscheme solarized')

-- debugger
vim.cmd("let g:vimspector_enable_mappings = 'HUMAN'")
vim.cmd("nmap <F2> :VimspectorReset<CR>")

-- remap multi-select insert caret keys
vim.cmd("let g:VM_maps = {}")
vim.cmd("let g:VM_maps['Add Cursor Down'] = '<A-Down>'")
vim.cmd("let g:VM_maps['Add Cursor Up'] = '<A-Up>'")

-- custom statusline
function get_cwd()
	local pwd = vim.fn.system("pwd 2> /dev/null | tr -d '\n'")
	return '/' .. string.match(pwd, "[^/]+$")
end

function get_git_branch()
	local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
	if branch ~= "" then
		return branch
	else
		return "None"
	end
end

function setup_statusline()
	vim.cmd('let branch="[' .. get_cwd() ..  ':' .. get_git_branch() .. ']"')
	vim.cmd('set statusline=%f%=%-25.75{branch}')
	vim.cmd('hi statusline guibg=teal guifg=grey78')
end
setup_statusline()

-- lsp
require'lspconfig'.pyright.setup{}

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()


-- autolint on save with autopep8
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ 
		pattern = "*.py",
		callback = function()
			local current_file = vim.fn.expand('%')
			os.execute("autopep8 -i " .. current_file)
			vim.cmd('checktime')
		end,
	}
)

