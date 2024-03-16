-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


vim.keymap.set("n", "<leader>CF", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end)

vim.keymap.set("n", "<leader>CG", function()
    vim.notify('Copied new guid to clipboard')
end)


vim.keymap.set("n", "<leader>RL", function()
    require("config.utils").ReloadLSP()
    vim.notify("LSP Reloaded!")
end, {desc = "Reload LSP"})

vim.keymap.set("n", "<C-t>", function()
  require("lazyvim.util").terminal.open({ "lazysql" }, {
    cwd = require("lazyvim.util").root.get(),
    ctrl_hjkl = false,
    border = "rounded",
    persistent = false,
    title = "lazysql",
    title_pos = "center",
  })
end, {desc = "lazysql"})

vim.keymap.set("n", "<C-d>", function()
  require("lazyvim.util").terminal.open({ "lazydocker" }, {
    cwd = require("lazyvim.util").root.get(),
    ctrl_hjkl = false,
    border = "rounded",
    persistent = false,
    title = "lazydocker",
    title_pos = "center",
  })
end, {desc = "lazydocker"})
