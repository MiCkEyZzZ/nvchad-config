local present, go = pcall(require, "go")

if not present then
  print "Не удалось загрузить go.nvim"
  return
end

go.setup {
  go = "go",
  gofmt = "gofumpt", -- Или "gofmt"
  fillstruct = "gopls",
  tag_options = "json=omitempty",
  icons = { breakpoint = "🧘", currentpos = "🏃" },
  verbose = false,
}

-- Установка необходимых бинарных файлов
local function ensure_dependencies()
  local dependencies = {
    "gopls",
    "gofumpt",
    -- Добавьте другие необходимые зависимости
  }

  for _, dependency in ipairs(dependencies) do
    local handle = io.popen("command -v " .. dependency)
    local result = handle and handle:read "*a" or ""
    if handle then
      handle:close()
    end
    if result == "" then
      print("Зависимость не установлена: " .. dependency)
      -- Здесь можно добавить команду для установки зависимостей
    end
  end
end

ensure_dependencies()
