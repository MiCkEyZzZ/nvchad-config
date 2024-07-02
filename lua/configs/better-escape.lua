local present, better_escape = pcall(require, "better_escape")

if not present then
  return
end

better_escape.setup {
  -- таблица с отображениями для использования
  mapping = { "jk", "jj" },
  -- время, в течение которого должны быть нажаты клавиши, указывается в мс. По умолчанию используется параметр timeoutlen
  timeout = vim.o.timeoutlen,
  -- очистите строку после экранирования, если есть пробелы только
  clear_empty_lines = false,
  keys = "<Esc>", -- клавиши, используемые для экранирования, если это функция, будут использовать результат каждый раз
  -- пример (рекомендуемый)
  -- keys = function()
  --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
  -- end,
}