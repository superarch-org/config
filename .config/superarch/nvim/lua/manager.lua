local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local superarch = vim.fn.expand("~/.config/superarch/nvim")
local custom = vim.fn.expand("~/.config/custom/nvim")

-- Make these visible immediately, before lazy setup runs.
for _, path in ipairs({ superarch, custom }) do
  if vim.fn.isdirectory(path) == 1 then
    vim.opt.rtp:prepend(path)
  end
end

local spec = {
  { import = "plugins" },
}

if vim.fn.isdirectory(custom .. "/lua/custom/plugins") == 1 then
  table.insert(spec, { import = "custom.plugins" })
end

require("lazy").setup({
  spec = spec,
  install = { missing = true },
  performance = {
    rtp = {
      reset = true,
      paths = {
        superarch,
        custom,
      },
    },
  },
})
