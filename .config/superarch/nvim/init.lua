vim.deprecate = function() end

-- Superarch Neovim base config
vim.opt.runtimepath:prepend(vim.fn.expand("~/.config/superarch/nvim"))

-- Key mappings
require("keymaps")

-- Core options
require("options")

-- Load theme
require("theme").setup();

-- Auto commands
require("autocmds");

-- Load plugins
require("manager")
