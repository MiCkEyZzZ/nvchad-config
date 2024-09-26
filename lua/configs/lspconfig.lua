local configs = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

-- Список языковых серверов
local servers = {
  "html",
  "cssls",
  "ts_ls", -- Используем ts_ls
  "clangd",
  "gopls",
  "gradle_ls",
  "tailwindcss",
  "prismals",
  "yamlls",
  "jsonls", -- JSON Language Server
  "marksman",
  "protols",
  "rust_analyzer",
  "pyright",
  "cmake",
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
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      if client.name == "gopls" then
        client.server_capabilities.documentHighlightProvider = false
      end
    end,
    capabilities = capabilities,
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      },
    },
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
      ts_ls = {
        disableAutomaticTypeAcquisition = false,
        lint = {
          enable = true,
        },
        format = {
          enable = true,
        },
        validate = { "typescript", "javascript" },
        suggest = {
          autoImports = true,
          includes = { "src/**/*.ts", "src/**/*.tsx" },
        },
        referencesCodeLens = true,
        renameOnType = true,
      },
      jsonls = {
        validate = { "json" },
        settings = {
          json = {
            schemas = {
              {
                fileMatch = { "package.json" },
                url = "https://json.schemastore.org/package.json",
              },
              {
                fileMatch = { ".prettierrc", ".prettierrc.json" },
                url = "https://json.schemastore.org/prettierrc.json",
              },
              {
                fileMatch = { "tsconfig*.json" },
                url = "https://json.schemastore.org/tsconfig.json",
              },
              -- Добавьте другие схемы по мере необходимости
            },
          },
        },
      },
    },
  }
end
