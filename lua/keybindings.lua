function setup()
	vim.cmd("let g:vimspector_enable_mappings = 'HUMAN'")
	vim.cmd("nmap <F2> :VimspectorReset<CR>")

	vim.cmd("let g:VM_maps = {}")
	vim.cmd("let g:VM_maps['Add Cursor Down'] = '<A-Down>'")
	vim.cmd("let g:VM_maps['Add Cursor Up'] = '<A-Up>'")
end

M = {
	setup = setup,
}

return M

