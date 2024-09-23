local present, dressing = pcall(require, "dressing")
if not present then
  print "Не удалось загрузить dressing.nvim"
  return
end

dressing.setup {
  input = {
    -- Настройки для input
    default_prompt = ">", -- Стандартный текст запроса
    prompt_align = "left", -- Выравнивание запроса
    win_options = {
      winhighlight = "Normal:Normal", -- Варианты выделения окна
    },
  },
  select = {
    backend = { "builtin", "telescope", "fzf" }, -- Возможные бэкенды
    builtin = {
      -- Настройки для встроенного бэкенда
      fullscreen = false, -- Полноэкранный режим
    },
  },
}
