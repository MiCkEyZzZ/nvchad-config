local present, wk = pcall(require, "which-key")
if not present then
  return
end

wk.setup {
  plugins = {
    marks = true, -- Показ закладок (marks)
    registers = true, -- Показ регистров
    spelling = {
      enabled = true, -- Включить подсказки для исправления орфографии
      suggestions = 20, -- Максимальное количество предложений для исправления
    },
  },
  replace = {}, -- Параметр для переопределения отображения клавиш
  filter = false, -- Не игнорировать отсутствующие сочетания клавиш
  win = { -- Замените window
    border = "rounded", -- Стиль границ (rounded, single, double и т.д.)
    position = "bottom", -- Позиция окна (bottom, top, left, right)
    margin = { 1, 2, 1, 2 }, -- Внешние отступы
    padding = { 2, 2, 2, 2 }, -- Внутренние отступы
  },
  layout = {
    height = { min = 4, max = 25 }, -- Высота окна
    width = { min = 20, max = 50 }, -- Ширина окна
    spacing = 3, -- Расстояние между элементами
  },
  show_help = true, -- Показывать подсказки по клавишам
  triggers = "auto", -- Установите на "auto" для автоматического определения триггеров
}

-- Регистрация пользовательских сочетаний клавиш
wk.register({
  f = {
    name = "File",
    f = { "<cmd>Telescope find_files<CR>", "Find file" },
    r = { "<cmd>Telescope oldfiles<CR>", "Refresh file" },
    s = { "<cmd>w<CR>", "Save file" },
  },
  g = {
    name = "Git",
    s = { "<cmd>Git status<CR>", "Status" },
    c = { "<cmd>Git commit<CR>", "Commit" },
    p = { "<cmd>Git push<CR>", "Push" },
  },
  w = {
    name = "Window",
    h = { "<C-w>h", "Split left" },
    j = { "<C-w>j", "Split below" },
    k = { "<C-w>k", "Close window" },
  },
}, { prefix = "<leader>" })
