vim.diagnostic.config({
  virtual_text = true, -- Show errors inline
  signs = true, -- Show signs in gutter
  underline = true, -- Underline errors
  update_in_insert = false, -- Don't update while typing
  severity_sort = true, -- Sort by severity
  float = {
    border = "rounded",
    source = "always", -- Show source in float
  },
})

-- Define diagnostic signs
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "󰌵" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
