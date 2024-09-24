local present, lualine = pcall(require, "lualine")

-- Проверяем, установлен ли lualine
if not present then
  return
end

-- Определяем цвета для статусной строки
local colors = {
  bg = "#202328", -- Цвет фона
  fg = "#bbc2cf", -- Цвет текста
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

-- Условия для отображения компонентов
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1 -- Проверяем, что буфер не пустой
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80 -- Скрываем в узких окнах
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Конфигурация lualine
local config = {
  options = {
    component_separators = "", -- Убираем разделители между компонентами
    section_separators = "", -- Убираем разделители между секциями
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } }, -- Цвета для нормального состояния
      inactive = { c = { fg = colors.fg, bg = colors.bg } }, -- Цвета для неактивного состояния
    },
  },
  sections = {
    lualine_a = {}, -- Секция A (можно добавить компоненты)
    lualine_b = {}, -- Секция B (можно добавить компоненты)
    lualine_y = {}, -- Секция Y (можно добавить компоненты)
    lualine_z = {}, -- Секция Z (можно добавить компоненты)
    lualine_c = {}, -- Секция C (будет заполнена позже)
    lualine_x = {}, -- Секция X (будет заполнена позже)
  },
  inactive_sections = {
    lualine_a = {}, -- Неактивная секция A
    lualine_b = {}, -- Неактивная секция B
    lualine_y = {}, -- Неактивная секция Y
    lualine_z = {}, -- Неактивная секция Z
    lualine_c = {}, -- Неактивная секция C
    lualine_x = {}, -- Неактивная секция X
  },
}

-- Функция для добавления компонентов в секцию C
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Функция для добавления компонентов в секцию X
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- Добавляем визуальный элемент в начало статусной строки
ins_left {
  function()
    return "▊"
  end,
  color = { fg = colors.blue }, -- Устанавливаем цвет
  padding = { left = 0, right = 1 }, -- Убираем пробел перед элементом
}

-- Добавляем компонент режима
ins_left {
  function()
    return "" -- Иконка для режима
  end,
  color = function()
    -- Автоматически меняем цвет в зависимости от режима Neovim
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] } -- Возвращаем цвет для текущего режима
  end,
  padding = { right = 1 },
}

-- Добавляем компонент размера файла
ins_left {
  "filesize",
  cond = conditions.buffer_not_empty, -- Условие для отображения
}

-- Добавляем компонент имени файла
ins_left {
  "filename",
  cond = conditions.buffer_not_empty, -- Условие для отображения
  color = { fg = colors.magenta, gui = "bold" }, -- Устанавливаем цвет и стиль
}

-- Добавляем компонент для отображения позиции курсора
ins_left { "location" }

-- Добавляем компонент для отображения прогресса
ins_left { "progress", color = { fg = colors.fg, gui = "bold" } }

-- Добавляем компонент для диагностики
ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" }, -- Источник диагностики
  symbols = { error = " ", warn = " ", info = " " }, -- Символы для диагностики
  diagnostics_color = {
    error = { fg = colors.red }, -- Цвет ошибок
    warn = { fg = colors.yellow }, -- Цвет предупреждений
    info = { fg = colors.cyan }, -- Цвет информации
  },
}

-- Вставляем пустую секцию
ins_left {
  function()
    return "%="
  end,
}

-- Добавляем компонент для отображения активного LSP
ins_left {
  function()
    local msg = "No Active Lsp" -- Сообщение, если LSP не активен
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype") -- Получаем тип файла
    local clients = vim.lsp.get_active_clients() -- Получаем активные LSP-клиенты
    if next(clients) == nil then
      return msg -- Если нет клиентов, возвращаем сообщение
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes -- Получаем поддерживаемые типы файлов
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name -- Возвращаем имя активного LSP
      end
    end
    return msg -- Возвращаем сообщение, если LSP не активен
  end,
  icon = " LSP:", -- Иконка для LSP
  color = { fg = "#ffffff", gui = "bold" }, -- Цвет и стиль
}

-- Добавляем компоненты в правую секцию
ins_right {
  "o:encoding", -- Компонент для отображения кодировки
  fmt = string.upper, -- Приводим к верхнему регистру
  cond = conditions.hide_in_width, -- Условие для отображения
  color = { fg = colors.green, gui = "bold" }, -- Устанавливаем цвет и стиль
}

ins_right {
  "fileformat", -- Компонент для отображения формата файла
  fmt = string.upper, -- Приводим к верхнему регистру
  icons_enabled = false, -- Отключаем иконки
  color = { fg = colors.green, gui = "bold" }, -- Устанавливаем цвет и стиль
}

ins_right {
  "branch", -- Компонент для отображения текущей ветки git
  icon = "", -- Иконка для ветки
  color = { fg = colors.violet, gui = "bold" }, -- Устанавливаем цвет и стиль
}

ins_right {
  "diff", -- Компонент для отображения различий
  symbols = { added = " ", modified = "󰝤 ", removed = " " }, -- Компонент для отображения различий
  diff_color = {
    added = { fg = colors.green }, -- Цвет для добавленных файлов
    modified = { fg = colors.orange }, -- Цвет для измененных файлов
    removed = { fg = colors.red }, -- Цвет для удаленных файлов
  },
  cond = conditions.hide_in_width, -- Условие для отображения
}

ins_right {
  function()
    return "▊"
  end,
  color = { fg = colors.blue }, -- Устанавливаем цвет
  padding = { left = 1 }, -- Добавляем отступ
}

-- Инициализируем lualine с заданной конфигурацией
lualine.setup(config)
