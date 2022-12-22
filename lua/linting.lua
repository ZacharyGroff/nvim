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

