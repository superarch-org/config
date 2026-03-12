-- Language definitions
return {
  javascript = {
    name = "JavaScript/TypeScript",
    lsp = "ts_ls",
    treesitter = { "javascript", "typescript", "tsx", "jsdoc" },
    mason_name = "typescript-language-server",
    root_markers = { "package.json", "tsconfig.json" }
  },
  python = {
    name = "Python",
    lsp = "pyright",
    treesitter = { "python" },
    mason_name = "pyright",
    root_markers = { "pyproject.toml", "setup.py", "requirements.txt" }
  },
  rust = {
    name = "Rust",
    lsp = "rust_analyzer",
    treesitter = { "rust" },
    mason_name = "rust-analyzer",
    root_markers = { "Cargo.toml" }
  },
  lua = {
    name = "Lua",
    lsp = "lua_ls",
    treesitter = { "lua" },
    mason_name = "lua-language-server",
    root_markers = { ".luarc.json", ".luacheckrc" }
  },
  go = {
    name = "Go",
    lsp = "gopls",
    treesitter = { "go", "gomod", "gosum" },
    mason_name = "gopls",
    root_markers = { "go.mod" }
  },
  c = {
    name = "C/C++",
    lsp = "clangd",
    treesitter = { "c", "cpp" },
    mason_name = "clangd",
    root_markers = { "compile_commands.json", ".clangd" }
  },
  bash = {
    name = "Bash",
    lsp = "bashls",
    treesitter = { "bash" },
    mason_name = "bash-language-server",
    root_markers = {},
  },
  html = {
    name = "HTML/CSS",
    lsp = "html",
    treesitter = { "html", "css" },
    mason_name = "html-lsp",
    root_markers = {},
  },
  json = {
    name = "JSON",
    lsp = "jsonls",
    treesitter = { "json" },
    mason_name = "json-lsp",
    root_markers = {},
  },
  yaml = {
    name = "YAML",
    lsp = "yamlls",
    treesitter = { "yaml" },
    mason_name = "yaml-language-server",
    root_markers = {},
  },
  markdown = {
    name = "Markdown",
    lsp = "marksman",
    treesitter = { "markdown", "markdown_inline" },
    mason_name = "marksman",
    root_markers = {},
  },
}
