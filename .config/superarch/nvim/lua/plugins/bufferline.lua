return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "thick",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })
  end,
}
