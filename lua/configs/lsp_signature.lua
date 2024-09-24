local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
  print "Не удалось загрузить lsp_signature.nvim"
  return
end

-- Настройка lsp_signature
lsp_signature.setup {
  bind = true, -- Привязать к функции для отображения подписи
  handler_opts = {
    border = "rounded", -- Стиль границы для отображения
    max_width = 80, -- Максимальная ширина подсказки
    max_height = 12, -- Максимальная высота подсказки
  },
  hint_enable = true, -- Включить подсказки
  hint_prefix = " ", -- Префикс для подсказки (например, значок)
  hint_scheme = "String", -- Цветовая схема для префикса подсказки
  always_trigger = false, -- Всегда показывать подсказку
  auto_pop = true, -- Автоматически закрывать подсказку после использования
  extra_trigger_chars = { ".", ":" }, -- Дополнительные символы для активации подсказки
  toggle_key = "<M-x>", -- Клавиша для переключения показа подсказки
  zindex = 200, -- Порядок отображения подсказки (больше - выше)
  close_timeout = 1000, -- Задержка перед закрытием подсказки (в миллисекундах)
}
