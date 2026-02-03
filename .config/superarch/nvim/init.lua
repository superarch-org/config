-- Superarch Neovim base config
vim.opt.runtimepath:prepend(vim.fn.expand("~/.config/superarch/nvim"))

-- Key mappings
require("keymaps")

-- Core options
require("options")

-- Auto commands
require("autocmds");

-- Load plugins
require("manager")
