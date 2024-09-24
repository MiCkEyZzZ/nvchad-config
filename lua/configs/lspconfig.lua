local configs = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

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
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr) -- Вызов вашей функции on_attach
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
    },
  }
  lspconfig.prismals.setup {}
end
