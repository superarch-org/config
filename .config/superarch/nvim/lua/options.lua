local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.tabstop = 2        -- Number of spaces a tab counts for
opt.shiftwidth = 2     -- Number of spaces for autoindent
opt.softtabstop = 2    -- Number of spaces for <Tab> in insert mode
opt.expandtab = true   -- Convert tabs to spaces

opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.textwidth = 79
opt.cursorline = true
opt.cursorlineopt = "number"

opt.viewoptions = { "cursor", "folds", "slash", "unix" }

opt.listchars = {
  eol = "$",
  tab = ">-",
  trail = "·",
  extends = ">",
  precedes = "<",
  nbsp = "¬"
}
opt.list = true
