-- Dynamic language-specific settings from languages.lua
local enabled = require("languager").load_enabled()
local languages = require("languages")

-- Build filetype to indent mapping
local filetype_settings = {}

for lang_id, is_enabled in pairs(enabled) do
  if is_enabled then
    local lang = languages[lang_id]
    if lang and lang.treesitter and lang.indent then
      for _, parser in ipairs(lang.treesitter) do
        filetype_settings[parser] = lang.indent
      end
    end
  end
end

-- Apply settings per filetype
for ft, settings in pairs(filetype_settings) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      -- Use vim.bo for buffer-local options to ensure they apply
      if settings.expandtab ~= nil then
        vim.bo.expandtab = settings.expandtab
      end
      if settings.tabstop then
        vim.bo.tabstop = settings.tabstop
        vim.bo.softtabstop = settings.tabstop
      end
      if settings.shiftwidth then
        vim.bo.shiftwidth = settings.shiftwidth
      end
    end,
  })
end
