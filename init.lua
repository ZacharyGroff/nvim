-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("dap-python").setup("~/.config/.virtualenvs/debugpy/bin/python")
