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

function setup()
	vim.cmd('let branch="[' .. get_cwd() ..  ':' .. get_git_branch() .. ']"')
	vim.cmd('set statusline=%f%=%-25.75{branch}')
	vim.cmd('hi statusline guibg=teal guifg=grey78')
end

M = {
	setup=setup,
}

return M
