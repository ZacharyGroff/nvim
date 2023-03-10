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
	vim.keymap.set('n', '<leader>sf', function()
		builtin.treesitter()
		vim.fn.feedkeys(":function:")
	end)
	vim.keymap.set('n', '<leader>sv', function()
		builtin.treesitter()
		vim.fn.feedkeys(":var:")
	end)
	vim.keymap.set('n', '<leader>b', builtin.git_branches)
	vim.keymap.set('n', '<leader>c', builtin.git_commits)
	vim.keymap.set('n', '<leader>ss', builtin.git_status)

	-- harpoon
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")
	vim.keymap.set("x", "<leader>p", [["_dP]])
	vim.keymap.set("n", "<leader>a", mark.add_file)
	vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

	vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
	vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
	vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
	vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
	vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)

	-- move highlighted lines
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

	-- keep cursor in middle while half-screen jumping
	vim.keymap.set("n", "<C-d>", "<C-d>zz")
	vim.keymap.set("n", "<C-u>", "<C-u>zz")

	-- preserve copied value when pasting over highlighted word
	vim.keymap.set("x", "<leader>p", [["_dP]])

	-- make current file executable
	vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
end

M = {
	setup = setup,
}

return M

