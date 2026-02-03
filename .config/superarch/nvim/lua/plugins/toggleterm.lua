return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<leader><space>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal", mode = {"n", "t"} },
  },
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float",  -- 'vertical' | 'horizontal' | 'tab' | 'float'
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })
  end,
}
