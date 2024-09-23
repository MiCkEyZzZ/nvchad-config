local present, gitsigns = pcall(require, "gitsigns")

if not present then
  print "Не удалось загрузить gitsigns.nvim"
  return
end

gitsigns.setup {
  signs = {
    add = { text = "▍" }, -- Знак для добавленных строк
    change = { text = "▍" }, -- Знак для изменённых строк
    delete = { text = "▸" }, -- Знак для удалённых строк
    topdelete = { text = "▴" }, -- Знак для удалённых строк вверху
    changedelete = { text = "▌" }, -- Знак для изменённых и удалённых строк
  },
  signcolumn = true, -- Показывать колонку со знаками
  numhl = false, -- Подсветка номеров строк
  linehl = false, -- Подсветка строк
  word_diff = false, -- Не показывать изменения в словах

  watch_gitdir = {
    interval = 1000, -- Интервал проверки изменений в директории Git
    follow_files = true, -- Следить за изменениями в файлах
  },
  current_line_blame = true, -- Показывать информацию о последних изменениях в текущей строке
  current_line_blame_opts = {
    virt_text = true, -- Использовать виртуальный текст для отображения информации
    virt_text_pos = "eol", -- Позиция виртуального текста (в конце строки)
    delay = 1000, -- Задержка перед отображением информации
    ignore_whitespace = true, -- Игнорировать пробелы при отображении информации
  },
  sign_priority = 6, -- Приоритет знаков
  update_debounce = 100, -- Задержка обновления состояния
  status_formatter = nil, -- Использовать стандартный форматтер для отображения статуса
}
