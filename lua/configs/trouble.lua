local status, trouble = pcall(require, "trouble")
if not status then
  print "Не удалось загрузить trouble.nvim"
  return
end

trouble.setup {
  icons = true,
  mode = "workspace_diagnostics",
  auto_open = false,
  auto_close = true,
  use_diagnostic_signs = true,
  signs = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠",
  },
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh",
    },
  },
  color_icons = true,
  default = false,
  strict = true,
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "Gitignore",
    },
  },
  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#81e043",
      name = "Log",
    },
    ["md"] = {
      icon = "",
      color = "#519aba",
      name = "Markdown",
    },
    ["yml"] = {
      icon = "",
      color = "#cbcb41",
      name = "YAML",
    },
    ["json"] = {
      icon = "ﬥ",
      color = "#cbcb41",
      name = "JSON",
    },
  },
}
