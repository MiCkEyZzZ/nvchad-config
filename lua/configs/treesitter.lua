-- Проверяем наличие nvim-treesitter
local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
  vim.notify("Не удалось загрузить nvim-treesitter", vim.log.levels.ERROR)
  return
end

-- Настройка nvim-treesitter
treesitter.setup {
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "typescript",
    "javascript",
    "go",
    "c",
    "cpp",
    "json",
    "yaml",
    "markdown",
    "rust",
    "proto",
    "sql",
    "toml",
    "ruby",
  }, -- укажи свои языки
  auto_install = true, -- Автоматическая установка отсутствующих парсеров
  highlight = {
    enable = true, -- Включение подсветки синтаксиса
    additional_vim_regex_highlighting = false, -- Отключение дополнительной регекс-подсветки
  },
  indent = {
    enable = true, -- Включение автоиндентации
    disable = { "yaml" }, -- Отключение автоиндентации для YAML
  },
  textobjects = {
    select = {
      enable = true, -- Включение поддержки textobjects
      lookahead = true, -- Автоперемещение к следующему объекту
      keymaps = {
        ["af"] = "@function.outer", -- Внешняя функция
        ["if"] = "@function.inner", -- Внутренняя функция
        ["ab"] = "@block.outer", -- Внешний блок
        ["ib"] = "@block.inner", -- Внутренний блок
      },
    },
  },
}

-- Получаем текущий тип файла
local filetype = vim.bo.filetype

-- Исключаем 'nvdash' из обработки
if filetype == "nvdash" then
  vim.notify(
    "Парсер для файла с типом '" .. filetype .. "' не найден. Игнорируем.",
    vim.log.levels.WARN
  )
  return
end

-- Проверяем наличие парсера для текущего типа файла
local parser_exists = pcall(vim.treesitter.get_parser, 0, filetype)

if not parser_exists then
  vim.notify(
    "Парсер для файла с типом '" .. filetype .. "' не найден.",
    vim.log.levels.WARN
  )
  return
end

-- Настройка автотегов, если используется nvim-ts-autotag
local present, autotag = pcall(require, "nvim-ts-autotag")
if present then
  autotag.setup {
    enable = true,
    filetypes = { "html", "xml", "javascript", "typescript", "jsx", "tsx", "vue" }, -- Поддерживаемые типы файлов
  }
else
  vim.notify("Не удалось загрузить nvim-ts-autotag", vim.log.levels.ERROR)
end
