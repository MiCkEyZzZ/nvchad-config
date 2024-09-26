local present, gitsigns = pcall(require, "gitsigns")

if not present then
  print "Не удалось загрузить gitsigns.nvim"
  return
end

-- Определяем цвета для каждого знака
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff00" }) -- Цвет для добавленных строк
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffff00" }) -- Цвет для изменённых строк
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000" }) -- Цвет для удалённых строк
vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#ffff00" }) -- Цвет для изменённых и удалённых строк

gitsigns.setup {
  signs = {
    add = { text = "▍", hl = "GitSignsAdd" }, -- Знак для добавленных строк
    change = { text = "▍", hl = "GitSignsChange" }, -- Знак для изменённых строк
    delete = { text = "▸", hl = "GitSignsDelete" }, -- Знак для удалённых строк
    changedelete = { text = "▌", hl = "GitSignsChangedelete" }, -- Знак для изменённых и удалённых строк
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

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Настройка клавиш для управления гит-знаками
    vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })
    vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
    vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { buffer = bufnr, desc = "Reset Buffer" })
    vim.keymap.set("n", "<leader>gh", gs.next_hunk, { buffer = bufnr, desc = "Next Hunk" })
    vim.keymap.set("n", "<leader>gH", gs.prev_hunk, { buffer = bufnr, desc = "Previous Hunk" })
  end,
}
