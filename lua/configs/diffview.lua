-- Проверяем, доступен ли модуль
local present, diffview = pcall(require, "diffview")

if not present then
  return
end

-- Настройка Diffview
diffview.setup {
  use_icons = true, -- Использовать иконки для отображения файлов и статусов
  enhanced_diff_hl = true, -- Включить улучшенную подсветку изменений
  file_panel = {
    win_config = {
      position = "left", -- Панель с измененными файлами будет слева
      width = 35, -- Ширина панели
    },
  },
  keymaps = {
    view = {
      ["q"] = "<cmd>DiffviewClose<CR>", -- Закрытие диффа по нажатию 'q'
    },
  },
}
