-- Проверка, если плагин markdown-preview.nvim установлен
local present, _ = pcall(require, "markdown-preview.nvim")
if not present then
  return
end

-- Настройка markdown-preview.nvim
vim.g.mkdp_theme = "dark" -- Установка тёмной темы предпросмотра
vim.g.mkdp_auto_start = 0 -- Отключить автозапуск предпросмотра
vim.g.mkdp_auto_close = 1 -- Автоматическое закрытие предпросмотра при переключении буфера
vim.g.mkdp_refresh_slow = 1 -- Более медленное обновление страницы для улучшения производительности
vim.g.mkdp_page_title = "${name} — Markdown Preview" -- Кастомизация заголовка страницы

-- Дополнительные параметры (по желанию)
vim.g.mkdp_filetypes = { "markdown" } -- Ограничение предпросмотра только для файлов .md
vim.g.mkdp_browser = "" -- Использовать браузер по умолчанию для предпросмотра
vim.g.mkdp_echo_preview_url = 1 -- Показать URL при запуске предпросмотра
