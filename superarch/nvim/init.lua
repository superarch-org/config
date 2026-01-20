-- Superarch Neovim base config: unified clipboard on Wayland

vim.opt.clipboard = "unnamedplus"

local fn = vim.fn
local function has(cmd) return fn.executable(cmd) == 1 end

if has("wl-copy") and has("wl-paste") then
  vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
      ["+"] = "wl-copy --foreground --type text/plain",
      ["*"] = "wl-copy --foreground --primary --type text/plain",
    },
    paste = {
      ["+"] = "wl-paste --no-newline",
      ["*"] = "wl-paste --no-newline --primary",
    },
    cache_enabled = 1,
  }
end

-- tiny sane defaults
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
