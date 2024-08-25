local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

-- Определяем список серверов для настройки
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

-- Ф-я для организации импорта для typescript файлов
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- Перебираем каждый сервер из списка и настраиваем
for _, lsp in ipairs(servers) do
  local settings = {}

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

  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      require("nvim_lsp_signature").setup()
    end,
    capabilities = capabilities,
    settings = settings,
    commands = lsp == "tsserver" and {
      OrganizeImports = {
        organize_imports,
        description = "Организация импорта",
      },
    } or nil,
  }
end
