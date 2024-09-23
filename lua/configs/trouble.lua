-- Подключаем trouble.nvim с обработкой ошибок
local status, trouble = pcall(require, "trouble")
if not status then
  print "Не удалось загрузить trouble.nvim"
  return
end

-- Настраиваем trouble.nvim
trouble.setup {
  icons = true, -- Включение иконок
  mode = "workspace_diagnostics", -- Режим отображения (диагностика для всего рабочего пространства)
  auto_open = false, -- Автоматически открывать Trouble при наличии сообщений
  auto_close = true, -- Автоматически закрывать Trouble, когда сообщений нет
  use_diagnostic_signs = true, -- Использовать знаки LSP для диагностики
  signs = {
    error = "", -- Иконка для ошибок
    warning = "", -- Иконка для предупреждений
    hint = "", -- Иконка для подсказок
    information = "", -- Иконка для информационных сообщений
    other = "﫠", -- Иконка для других сообщений
  },
  override = {
    zsh = { -- Переопределение иконок и цветов для файлов .zsh
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh",
    },
  },
  color_icons = true, -- Включение цветных иконок
  default = false, -- Использовать значения по умолчанию
  strict = true, -- Строгий режим
  override_by_filename = { -- Переопределение по имени файла
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "Gitignore",
    },
  },
  override_by_extension = { -- Переопределение по расширению файла
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
