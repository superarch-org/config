return {
  javascript = {
    name = "JavaScript/TypeScript",
    lsp = "ts_ls",
    treesitter = { "javascript", "typescript", "tsx", "jsdoc" },
    mason_name = "typescript-language-server",
    formatters = { "eslint_d" },
    root_markers = { "package.json", "tsconfig.json" },
    indent = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  },

  svelte = {
    name = "Svelte",
    lsp = "svelte",
    treesitter = { "svelte" },
    mason_name = "svelte-language-server",
    formatters = {},
    root_markers = { "svelte.config.js", "svelte.config.ts" },
    indent = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  },

  python = {
    name = "Python",
    lsp = "pyright",
    treesitter = { "python" },
    mason_name = "pyright",
    formatters = { "ruff" },
    root_markers = { "pyproject.toml", "setup.py", "requirements.txt" },
    indent = { expandtab = true, tabstop = 4, shiftwidth = 4 },
  },

  rust = {
    name = "Rust",
    lsp = "rust_analyzer",
    treesitter = { "rust" },
    mason_name = "rust-analyzer",
    formatters = { "rustfmt" },
    root_markers = { "Cargo.toml" },
    indent = { expandtab = true, tabstop = 4, shiftwidth = 4 },
  },

  lua = {
    name = "Lua",
    lsp = "lua_ls",
    treesitter = { "lua" },
    mason_name = "lua-language-server",
    formatters = { "stylua" },
    root_markers = { ".luarc.json", ".luacheckrc" },
    indent = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  },

  go = {
    name = "Go",
    lsp = "gopls",
    treesitter = { "go", "gomod", "gosum" },
    mason_name = "gopls",
    formatters = { "gofmt", "goimports" },
    root_markers = { "go.mod" },
    indent = { expandtab = false, tabstop = 2, shiftwidth = 2 }, -- Go uses tabs
  },

  c = {
    name = "C/C++",
    lsp = "clangd",
    treesitter = { "c", "cpp" },
    mason_name = "clangd",
    formatters = { "clang-format" },
    root_markers = { "compile_commands.json", ".clangd" },
    indent = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  },

  bash = {
    name = "Bash",
    lsp = "bashls",
    treesitter = { "bash" },
    mason_name = "bash-language-server",
    formatters = { "shfmt" },
    root_markers = {},
    indent = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  },

  html = {
    name = "HTML/CSS",
    lsp = "html",
    treesitter = { "html", "css" },
    mason_name = "html-lsp",
    formatters = { "prettier" },
    root_markers = {},
    indent = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  },

  json = {
    name = "JSON",
    lsp = "jsonls",
    treesitter = { "json" },
    mason_name = "json-lsp",
    formatters = { "prettier" },
    root_markers = {},
    indent = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  },

  yaml = {
    name = "YAML",
    lsp = "yamlls",
    treesitter = { "yaml" },
    mason_name = "yaml-language-server",
    formatters = { "prettier" },
    root_markers = {},
    indent = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  },

  markdown = {
    name = "Markdown",
    lsp = "marksman",
    treesitter = { "markdown", "markdown_inline" },
    mason_name = "marksman",
    formatters = { "prettier" },
    root_markers = {},
    indent = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  },

  zig = {
    name = "Zig",
    lsp = "zls",
    treesitter = { "zig" },
    mason_name = "zls",
    formatters = {},
    root_markers = { "build.zig" },
    indent = { expandtab = true, tabstop = 4, shiftwidth = 4 },
  },

  marko = {
    name = "Marko",
    lsp = "marko-js",
    filetypes = { "marko" },
    extensions = { "marko" },
    treesitter = {}, -- No treesitter parser yet
    mason_name = "marko-language-server",
    formatters = {},
    root_markers = { "package.json" },
    indent = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  },
}
