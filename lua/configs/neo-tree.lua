local present, neo_tree = pcall(require, "neo-tree")
if not present then
  print "Не удалось загрузить neo-tree"
  return
end

neo_tree.setup {
  close_if_last_window = true, -- Закрывать, если это последнее окно
  popup_border_style = "rounded", -- Стиль границы всплывающих окон
  enable_git_status = true, -- Включить статус git
  enable_diagnostics = true, -- Включить диагностику
  default_component_configs = {
    name = {
      use_git_status_colors = true, -- Использовать цвета статусов git
    },
    git_status = {
      symbols = {
        added = "✚", -- Добавленные файлы
        modified = "✏️", -- Измененные файлы
        deleted = "✖️", -- Удаленные файлы
        renamed = "➜", -- Переименованные файлы
        untracked = "★", -- Неотслеживаемые файлы
        ignored = "☒", -- Игнорируемые файлы
      },
    },
  },
  window = {
    position = "left", -- Позиция окна (left, right, top, bottom)
    width = 30, -- Ширина окна
    mappings = {
      ["<space>"] = "toggle_node", -- Переключение узлов
      ["<cr>"] = "open", -- Открытие файла или папки
      ["<bs>"] = "close_node", -- Закрытие узлов
      ["<leader>r"] = "refresh", -- Обновление дерева
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = true, -- Скрыть файлы с точкой
      hide_gitignored = true, -- Скрыть игнорируемые git файлы
    },
    follow_current_file = true, -- Следить за текущим файлом
    group_empty_dirs = true, -- Группировка пустых директорий
  },
}

-- Привязка клавиш для открытия/закрытия neo-tree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
