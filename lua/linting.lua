-- autolint on save
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{
		pattern = "*.py",
		command = "!ssort % && isort % --profile=black && black %"
	}
)
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{
		pattern = "*.tsx,*.ts",
		command = "!prettier -w %"
	}
)

