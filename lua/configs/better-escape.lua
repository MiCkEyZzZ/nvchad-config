local present, better_escape = pcall(require, "better_escape")

if not present then
  vim.notify("Не удалось загрузить better_escape", vim.log.levels.ERROR)
  return
end

vim.notify("better_escape успешно загружен", vim.log.levels.INFO)

better_escape.setup {
  mapping = { "jk", "jj" },
  timeout = 300,
  clear_empty_lines = false,
  keys = function()
    return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<Esc>l" or "<Esc>"
  end,
}

vim.notify("better_escape успешно настроен", vim.log.levels.INFO)
