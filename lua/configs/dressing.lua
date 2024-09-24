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
    border = "rounded", -- Добавляем скругленные границы
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None", -- Улучшаем выделение окна
      cursorline = true, -- Подсвечиваем текущую строку
    },
    -- Цветовые настройки для гармонии с темой
    colormap = {
      background = "#1e222a", -- Темный фон для окна
      border = "#56b6c2", -- Цвет границ окна
      text = "#abb2bf", -- Цвет текста
    },
  },
  select = {
    backend = { "builtin", "telescope", "fzf" }, -- Возможные бэкенды
    builtin = {
      -- Настройки для встроенного бэкенда
      border = "double", -- Двойные границы для более четкого вида
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      max_width = { 140, 0.8 }, -- Устанавливаем максимальную ширину окна
      max_height = { 30, 0.9 }, -- Устанавливаем максимальную высоту окна
      min_width = { 40, 0.4 }, -- Минимальная ширина окна
      min_height = { 10, 0.2 }, -- Минимальная высота окна
      colormap = {
        background = "#1e222a",
        border = "#c678dd",
        text = "#abb2bf",
      },
      cursorline = true,
      prompt_position = "top", -- Размещаем запрос сверху для улучшения UX
    },
  },
}
