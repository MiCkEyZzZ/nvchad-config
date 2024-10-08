require "nvchad.mappings"

local map = vim.keymap.set

-- Переключение в командный режим
map("n", ";", ":", { desc = "CMD переход в командный режим" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Сохранить" })

-- Управление буферами
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Закрыть Все буферы" })

-- Поиск задач
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Найти Задача" })

-- Управление окнами
map("n", "\\", "<cmd>:vsplit <CR>", { desc = "Вертикальное Разделение" })

-- Прокрутка через tmux
map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>", { desc = "Tmux Вправо" })
map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>", { desc = "Tmux Влево" })
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>", { desc = "Tmux Вверх" })
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>", { desc = "Tmux Вниз" })

-- Trouble
map("n", "<leader>qx", "<cmd>TroubleToggle<CR>", { desc = "Открыть Проблема" })
map("n", "<leader>qw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Открыть Workspace Trouble" })
map("n", "<leader>qd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Открыть Document Trouble" })
map("n", "<leader>qq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Открыть Quickfix" })
map(
  "n",
  "<leader>ql",
  "<cmd>TroubleToggle loclist<CR>",
  { desc = "Открыть Список местоположений" }
)
map("n", "<leader>qt", "<cmd>TodoTrouble<CR>", { desc = "Открыть Todo Trouble" })

-- Поиск
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Найти Файлы" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Найти Всё" }
)
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Живой grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Найти Буферы" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Найти Помощь" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Найти Предыдущие файлы" })
map(
  "n",
  "<leader>fk",
  "<cmd>Telescope current_buffer_fuzzy_find<CR>",
  { desc = "Найти в текущем буфере" }
)

-- Тесты
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Запуск Ближайший тест" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Запуск Файловый тест" })
map(
  "n",
  "<leader>to",
  ":Neotest output<CR>",
  { desc = "Показать Результаты тестирования" }
)
map(
  "n",
  "<leader>ts",
  ":Neotest summary<CR>",
  { desc = "Показать Сводка результатов тестирования" }
)

-- Debug
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Переключение Debug UI" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Переключение Точка остановки" })
map("n", "<leader>ds", function()
  require("dap").continue()
end, { desc = "Начать или продолжить отладку" })
map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Step Over" })

-- Git
map("n", "<leader>gl", ":Flog<CR>", { desc = "Git Журнал" })
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "Git История файлов" })
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Git Последняя фиксация" })
map("n", "<leader>gt", ":DiffviewToggleFile<CR>", { desc = "Git История изменений файла" })

-- Терминал
map("n", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Переключение Вертикальный терминал" })
map("n", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.3 }
end, { desc = "Переключение Горизонтальный терминал" })
map("n", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Переключение плавающего терминала" })
map("t", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp" }
end, { desc = "Переключение Вертикальный терминал" })
map("t", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Переключение Горизонтальный терминал" })
map("t", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Переключение плавающего терминала" })

-- Базовые
map("i", "jj", "<ESC>", { desc = "Выход из режима вставки" })
map("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, desc = "Принять предложение Codeium" })

-- Markdown Preview
map("n", "<leader>mp", "<CMD> MarkdownPreview<CR>", { desc = "Открыть предпросмотр" })
map("n", "<leader>mc", "<CMD> MarkdownPreviewStop<CR>", { desc = "Закрыть предпросмотр" })

-- Комментирование и раскомментирование с помощью Comment.nvim
map("n", "<leader>c", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Закомментировать текущую строку" })
map("x", "<leader>c", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Закомментировать выделенное" })

-- Ctrl+n для открытия NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Открыть NvimTree" })

-- Мышь для перетаскивания вкладок
vim.opt.mouse = "a"

-- Выделение с Shift и стрелками
vim.api.nvim_set_keymap("n", "<S-Up>", "v<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Down>", "v<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Left>", "v<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Right>", "v<Right>", { noremap = true, silent = true })
