local configs = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

-- Определяем функции для управления поведением LSP
local on_attach = configs.on_attach
local capabilities = configs.capabilities

-- Список языковых серверов
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "gopls",
  "gradle_ls",
  "tailwindcss",
  "prismals",
  "yamlls",
  "jsonls",
  "marksman",
  "protols",
  "rust_analyzer",
  "pyright",
}

-- Функция для организации импорта в TypeScript
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- Перебираем языковые серверы и настраиваем их
for _, lsp in ipairs(servers) do
  local settings = {}

  -- Специфические настройки для некоторых серверов
  if lsp == "gopls" then
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    }
  elseif lsp == "tsserver" then
    settings = {
      tsserver = {
        preferences = {
          importModuleSpecifierPreference = "none-relative",
        },
      },
    }
  end

  -- Настройка LSP сервера
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr) -- Подключение пользовательских функций на прикрепление
      require("nvim_lsp_signature").setup() -- Подключение для подписи LSP
    end,
    capabilities = capabilities,
    settings = settings,
    commands = lsp == "tsserver"
        and {
          OrganizeImports = {
            organize_imports,
            description = "Организация импорта", -- Описание команды
          },
        }
      or nil,
  }
end
