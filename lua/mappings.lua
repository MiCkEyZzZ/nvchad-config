require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD переход в командный режим" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Сохранить" })
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Закрыть Все буферы" })

map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Найти Задача" })
map("n", "\\", "<cmd>:vsplit <CR>", { desc = "Вертикальный Разделение" })
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

-- Найти
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
end, { desc = "Начало" })
map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Step Over" })

-- Git
map("n", "<leader>gl", ":Flog<CR>", { desc = "Git Журнал" })
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "Git История файлов" })
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Git Последняя фиксация" })
map("n", "<leader>gt", ":DiffviewToggleFile<CR>", { desc = "Git File History" })

-- Терминал
map("n", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Переключение Вертикальный терминал" })
map("n", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.4 }
end, { desc = "Переключение Горизонтальный терминал" })
map("n", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Переключение Terminal Float" })
map("t", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp" }
end, { desc = "Переключение Вертикальный терминал" })
map("t", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Переключение Горизонтальный терминал" })
map("t", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })

-- Базовые
map("i", "jj", "<ESC>")
map("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })
