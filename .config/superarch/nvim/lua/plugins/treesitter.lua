return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local enabled = require("languager").load_enabled()
    local languages = require("languages")
    local parsers = { "vim", "vimdoc", "query" }

    for lang_id, is_enabled in pairs(enabled) do
      if is_enabled then
        local lang = languages[lang_id]
        if lang and lang.treesitter then
          for _, parser in ipairs(lang.treesitter) do
            table.insert(parsers, parser)
          end
        end
      end
    end

    require("nvim-treesitter.config").setup({
      ensure_installed = parsers,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
