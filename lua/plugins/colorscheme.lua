return {
  -- add solarized
  { "ishan9299/nvim-solarized-lua" },

  -- Configure LazyVim to load solarized
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
}
