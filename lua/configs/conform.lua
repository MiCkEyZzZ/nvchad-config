local present, conform = pcall(require, "conform")

if not present then
  print "Не удалось загрузить conform.nvim"
  return
end

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    markdown = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    prisma = { "prisma_fmt" }, -- для этого нужно локально установить npm install -g prisma
    go = { "goimports" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "black" },
    ruby = { "rubocop" },
    sql = { "sqlfluff" },
    rust = { "rustfmt" },
    -- Добавь свои форматтеры при необходимости
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

conform.setup(options)

-- Функция для проверки установленных форматтеров
local function ensure_formatter_installed(formatter)
  local handle = io.popen("command -v " .. formatter)
  local result = handle and handle:read "*a" or ""
  if handle then
    handle:close()
  end
  return result ~= ""
end

local required_formatters = {
  "black",
  "clang-format",
  "goimports",
  "prettier",
  "sqlfluff",
  "stylua",
  "thrift",
  "rubocop",
}

local missing_formatters = {}

for _, formatter in ipairs(required_formatters) do
  if not ensure_formatter_installed(formatter) then
    table.insert(missing_formatters, formatter)
  end
end

if #missing_formatters > 0 then
  print(
    "Не установлены следующие форматтеры: " .. table.concat(missing_formatters, ", ")
  )
  -- Можно добавить команды для установки форматтеров, например:
  -- os.execute("sudo nala install " .. table.concat(missing_formatters, " "))
end
