return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" }, -- load when editing
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc",
      "bash", "python",
      "javascript", "typescript",
      "rust", "go",
      "c", "cpp",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.config").setup(opts)
  end,
}
