local M = {}

local enabled_file = vim.fn.expand("~/.config/current/nvim-languages.json")

function M.load_enabled()
  if vim.fn.filereadable(enabled_file) == 0 then
    return {}
  end

  local file = io.open(enabled_file, "r")
  if not file then
    return {}
  end

  local content = file:read("*a")
  file:close()

  local ok, data = pcall(vim.json.decode, content)
  if not ok then
    return {}
  end

  return data or {}
end

function M.save_enabled(enabled)
  local dir = vim.fn.fnamemodify(enabled_file, ":h")
  vim.fn.mkdir(dir, "p")

  local file = io.open(enabled_file, "w")
  if not file then
    vim.notify("Failed to save enabled languages", vim.log.levels.ERROR)
    return
  end

  file:write(vim.json.encode(enabled))
  file:close()
end

function M.enable(lang_id)
  local languages = require("languages")
  local lang = languages[lang_id]

  if not lang then
    vim.notify("Unknown language: " .. lang_id, vim.log.levels.ERROR)
    return
  end

  local enabled = M.load_enabled()
  enabled[lang_id] = true
  M.save_enabled(enabled)

  vim.notify("Enabled " .. lang.name, vim.log.levels.INFO)
end

function M.setup_lsps()
  local enabled = M.load_enabled()
  local languages = require("languages")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }

    -- Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    -- Actions
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", function()
      require("tiny-code-action").code_action()
    end, opts)
    vim.keymap.set("v", "<leader>ca", function()
      require("tiny-code-action").code_action()
    end, opts)

    -- Format
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end

  for lang_id, is_enabled in pairs(enabled) do
    if is_enabled then
      local lang = languages[lang_id]
      if lang and lang.lsp then
        local cfg = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        if lang.root_markers and #lang.root_markers > 0 then
          cfg.root_markers = lang.root_markers
        end

        if lang.lsp == "lua_ls" then
          cfg.settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }, -- Recognize vim as global
              },
              workspace = {
                library = {
                  vim.fn.expand("$VIMRUNTIME/lua"),
                  vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                  vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                },
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          }
        end

        vim.lsp.config(lang.lsp, cfg)
        vim.lsp.enable(lang.lsp)
      end
    end
  end
end

function M.get_available()
  local languages = require("languages")
  local enabled = M.load_enabled()
  local list = {}

  for id, lang in pairs(languages) do
    table.insert(list, {
      id = id,
      name = lang.name,
      enabled = enabled[id] or false,
    })
  end

  table.sort(list, function(a, b)
    return a.name < b.name
  end)

  return list
end

return M
