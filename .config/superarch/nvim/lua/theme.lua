-- Base16 theme integration for Neovim
local M = {}

-- Read theme.yaml and parse base16 colors
function M.load_colors()
  local theme_file = vim.fn.expand("~/.config/current/theme.yaml")
  local colors = {}

  if vim.fn.filereadable(theme_file) == 0 then
    vim.notify("Theme file not found: " .. theme_file, vim.log.levels.WARN)
    return colors
  end

  for line in io.lines(theme_file) do
    local key, value = line:match('^%s*(base%x%x):%s*"(#%x%x%x%x%x%x)"')
    if key and value then
      colors[key] = value
    end
  end

  return colors
end

-- Apply base16 colors to Neovim
function M.setup()
  local c = M.load_colors()

  if vim.tbl_isempty(c) then
    return
  end

  -- Reset existing highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "base16-superarch"

  -- Define highlight groups
  local highlights = {
    -- Editor
    Normal = { fg = c.base05, bg = c.base00 },
    NormalFloat = { fg = c.base05, bg = c.base01 },
    CursorLine = { bg = c.base01 },
    CursorLineNr = { fg = c.base0D, bg = c.base01, bold = true },
    LineNr = { fg = c.base03 },
    SignColumn = { fg = c.base03, bg = c.base00 },
    ColorColumn = { bg = c.base01 },
    VertSplit = { fg = c.base03 },
    StatusLine = { fg = c.base05, bg = c.base02 },
    StatusLineNC = { fg = c.base03, bg = c.base01 },
    Pmenu = { fg = c.base05, bg = c.base01 },
    PmenuSel = { fg = c.base00, bg = c.base0D },
    Visual = { bg = c.base02 },
    Search = { fg = c.base00, bg = c.base0A },
    IncSearch = { fg = c.base00, bg = c.base09 },

    -- Syntax
    Comment = { fg = c.base03, italic = true },
    Constant = { fg = c.base09 },
    String = { fg = c.base0B },
    Character = { fg = c.base08 },
    Number = { fg = c.base09 },
    Boolean = { fg = c.base09 },
    Float = { fg = c.base09 },
    Identifier = { fg = c.base08 },
    Function = { fg = c.base0D },
    Statement = { fg = c.base0E },
    Conditional = { fg = c.base0E },
    Repeat = { fg = c.base0E },
    Label = { fg = c.base0E },
    Operator = { fg = c.base05 },
    Keyword = { fg = c.base0E },
    Exception = { fg = c.base08 },
    PreProc = { fg = c.base0A },
    Include = { fg = c.base0D },
    Define = { fg = c.base0E },
    Macro = { fg = c.base08 },
    Type = { fg = c.base0A },
    StorageClass = { fg = c.base0A },
    Structure = { fg = c.base0E },
    Special = { fg = c.base0C },
    Error = { fg = c.base00, bg = c.base08 },
    Todo = { fg = c.base0A, bg = c.base01 },

    -- Diagnostics (red errors, yellow warnings, etc.)
    DiagnosticError = { fg = c.base08 }, -- Red
    DiagnosticWarn = { fg = c.base0A }, -- Yellow
    DiagnosticInfo = { fg = c.base0D }, -- Blue
    DiagnosticHint = { fg = c.base0C }, -- Cyan
    DiagnosticUnderlineError = { undercurl = true, sp = c.base08 },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.base0A },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.base0D },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.base0C },

    -- Diff
    DiffAdd = { fg = c.base0B, bg = c.base01 },
    DiffChange = { fg = c.base0A, bg = c.base01 },
    DiffDelete = { fg = c.base08, bg = c.base01 },
    DiffText = { fg = c.base0D, bg = c.base01 },

    -- Git signs
    GitSignsAdd = { fg = c.base0B },
    GitSignsChange = { fg = c.base0A },
    GitSignsDelete = { fg = c.base08 },

    -- Telescope
    TelescopeBorder = { fg = c.base0D },
    TelescopePromptBorder = { fg = c.base0D },
    TelescopeResultsBorder = { fg = c.base0D },
    TelescopePreviewBorder = { fg = c.base0D },

    -- Which-key
    WhichKey = { fg = c.base0D },
    WhichKeyGroup = { fg = c.base0C },
    WhichKeyDesc = { fg = c.base05 },
    WhichKeySeparator = { fg = c.base03 },
  }

  -- Apply highlights
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
