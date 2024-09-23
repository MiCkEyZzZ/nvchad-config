local status, treesitter = pcall(require, "nvim-treesitter")
if not status then
  print "Не удалось загрузить nvim-treesitter"
  return
end

treesitter.setup {
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "typescript",
    "javascript",
    "go",
    "c",
    "cpp",
    "json",
    "yaml",
    "markdown",
    "rust",
    "proto",
    "prisma",
    "sql",
    "toml",
    "json",
    "ruby",
  }, -- укажи свои языки
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { "yaml" },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      },
    },
  },
}
