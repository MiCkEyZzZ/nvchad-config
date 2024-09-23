local status, codeium = pcall(require, "codeium")
if not status then
  print "Не удалось загрузить codeium.vim"
  return
end

-- Настройки для codeium
codeium.setup {
  keymap = {
    accept = "<C-e>", -- Принять текущее предложение
    prev = "<C-p>", -- Перейти к предыдущему предложению
    next = "<C-n>", -- Перейти к следующему предложению
    dismiss = "<C-d>", -- Отклонить текущее предложение
  },

  -- Конфигурация поведения
  behavior = {
    auto_select = true, -- Автоматически выбирать первое предложение
    show_in_insert = true, -- Показать предложения в режиме вставки
  },

  -- Опции для настроек графического интерфейса
  ui = {
    border = "rounded", -- Установить стиль рамки
    position = "bottom", -- Позиция для вывода предложений
  },

  -- Дополнительные настройки могут быть добавлены здесь
}
