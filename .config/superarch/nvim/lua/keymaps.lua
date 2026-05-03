-- Leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })

-- Clear search highlighting
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Dedent selection" })

-- Buffer navigation with Tab/Shift-Tab (in normal mode)
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
-- Close current buffer
vim.keymap.set("n", "<leader><Esc>", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "ZZ", ":wqa<CR>", { desc = "Save and quit all" })

-- LSP Diagnostics
vim.keymap.set("n", "<leader><leader>", function()
  vim.diagnostic.jump({ count = 1, float = false })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>p", function()
  vim.diagnostic.open_float()
end, { desc = "Show diagnostic float" })

-- New buffer
vim.keymap.set("n", "<leader><Space>", ":enew<CR>", { desc = "New empty buffer" })

-- Close all floating windows with Esc
vim.keymap.set("n", "<Esc>", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= "" then
      vim.api.nvim_win_close(win, true)
    end
  end
end, { desc = "Close all floating windows" })

-- Tab management
vim.keymap.set("n", "tt", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "tx", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "tn", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "tp", ":tabprev<CR>", { desc = "Previous tab" })
