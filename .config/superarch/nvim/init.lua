vim.deprecate = function() end

-- Superarch Neovim base config
vim.opt.runtimepath:prepend(vim.fn.expand("~/.config/superarch/nvim"))

-- Key mappings
require("keymaps")

-- Core options
require("options")

-- Theme
require("theme").setup()

-- Diagnostics
require("diagnostics")

-- Filetype-specific settings
require("filetypes")

-- Auto commands
require("autocmds")

-- Load plugins
require("manager")
