local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
  print "Не удалось загрузить lsp_signature.nvim"
  return
end

-- Настройка lsp_signature
lsp_signature.setup {
  bind = true, -- привязать к функции
  handler_opts = {
    border = "rounded", -- стиль границы для отображения
  },
  hint_enable = true, -- включить подсказки
  hint_prefix = " ", -- префикс для подсказки
  max_height = 12, -- максимальная высота подсказки
  max_width = 80, -- максимальная ширина подсказки
  always_trigger = false, -- всегда показывать подсказку
  auto_pop = true, -- автоматически закрывать подсказку
}
