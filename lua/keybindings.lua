function setup()

	-- vimspector
	vim.cmd("let g:vimspector_enable_mappings = 'HUMAN'")
	vim.cmd("nmap <F2> :VimspectorReset<CR>")

	-- visual-multi
	vim.cmd("let g:VM_maps = {}")
	vim.cmd("let g:VM_maps['Add Cursor Down'] = '<A-Down>'")
	vim.cmd("let g:VM_maps['Add Cursor Up'] = '<A-Up>'")

	-- trouble
	vim.cmd("nmap <C-t> :TroubleToggle<CR>")

	-- fugitive
	vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

	-- telescope (requires brew install ripgrep)
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<C-f>', builtin.git_files, {})
	vim.keymap.set('n', '<leader>f', function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end)
end

M = {
	setup = setup,
}

return M

