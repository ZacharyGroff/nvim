function setup()
	vim.cmd('set termguicolors')
	vim.cmd('set background=light')
	vim.cmd('colorscheme solarized')
end

M = {
	setup = setup,
}

return M

