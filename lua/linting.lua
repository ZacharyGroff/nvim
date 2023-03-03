-- autolint on save
vim.api.nvim_create_autocmd(
	"BufRead",
	{
		pattern = "*.py",
		command = "setlocal ts=4 sw=4 expandtab"
	}
)
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{
		pattern = "*.py",
		command = "!ssort % && isort % --profile=black && black %"
	}
)
vim.api.nvim_create_autocmd(
	"BufRead",
	{
		pattern = "*.tsx,*.ts",
		command = "setlocal ts=2 sw=2 expandtab"
	}
)
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{
		pattern = "*.tsx,*.ts",
		command = "!prettier -w %"
	}
)

