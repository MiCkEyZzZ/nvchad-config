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
    prisma = { "prettier" },
    go = { "goimports" },
    gomod = { "goimports" },
    gosum = { "goimports" },
    gowork = { "goimports" },
    thrift = { "thrift" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "black" },
    ruby = { "rubocop" },
    sql = { "sqlfluff" },
  },

  format_on_save = {
    -- Эти параметры будут переданы в conform.format()
    timeout_ms = 500, -- задаёт формат для форматирования
    lsp_fallback = true, -- использует LSP для форматирования, если нет другого форматтера
  },
}

require("conform").setup(options)

-- Проверка установленных фоматтеров и установить отсутствующие
local function ensure_formatter_Installed(formatter)
  local handle = io.popen("command -v " .. formatter)
  -- если форматтер не установлен, вернуть false
  if not handle then
    return false
  end
  local result = handle:read "*a"
  handle:close()
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
  "sqlfluff",
  "robocop",
}

for _, formatter in ipairs(required_formatters) do
  if not ensure_formatter_Installed(formatter) then
    print("Форматтер не установлен: " .. formatter)
    -- здесь можно добавить команду для установки форматтера, например:
    -- os.execute("sudo nala install " .. formatter) -- для Ubuntu
  end
end
