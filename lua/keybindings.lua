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
end

M = {
	setup = setup,
}

return M

