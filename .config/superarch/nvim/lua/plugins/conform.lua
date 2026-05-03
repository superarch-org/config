return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
      formatters = {
        stylua = {
          prepend_args = { "--config-path", vim.fn.expand("~/.config/superarch/stylua.toml") },
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "eslint_d" },
        svelte = { "eslint_d" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        python = { "ruff_organize_imports", "ruff_format" },
        rust = { "rustfmt" },
        go = { "gofmt" },
      },
    })
  end,
}
