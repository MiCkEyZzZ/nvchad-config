local present, better_escape = pcall(require, "better_escape")

if not present then
  return
end

vim.o.timeoutlen = 300 -- устанавливаем таймаут на 300 мс, если не установлен

better_escape.setup {
  mapping = { "jk", "jj" }, -- таблица с отображениями для использования
  timeout = vim.o.timeoutlen, -- время, в течение которого должны быть нажаты клавиши, указывается в мс.
  -- По умолчанию используется параметр timeoutlen
  clear_empty_lines = false, -- очистите строку после экранирования, если есть только пробелы
  keys = "<Esc>", -- клавиши, используемые для экранирования, если это функция, будут использовать результат каждый раз
  -- пример(recommended)
  -- keys = function()
  --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
  -- end,
}
