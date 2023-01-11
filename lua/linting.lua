-- autolint on save with autopep8
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{
		pattern = "*.py",
		command = "!ssort % && isort % && black %"
	}
)

