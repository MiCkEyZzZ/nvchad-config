local present, noice = pcall(require, "noice")
if not present then
  print "Не удалось загрузить noice.nvim"
  return
end

noice.setup {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- требуется hrsh7th/nvim-cmp
    },
    hover = { enabled = false }, -- Отключаем hover
    signature = { enabled = false }, -- Отключаем подписи
    message = { enabled = true }, -- Включаем обработку сообщений LSP
    documentHighlight = { enabled = false }, -- Отключаем `documentHighlight`
  },
  presets = {
    bottom_search = true, -- Нижняя строка поиска
    command_palette = true, -- Командная строка и меню
    long_message_to_split = true, -- Длинные сообщения в разделённом окне
    inc_rename = false, -- Отключаем диалоговое окно ввода для inc-rename
    lsp_doc_border = false, -- Без рамки для документации
  },
}

-- Необязательно: можете также обрабатывать другие уведомления или сообщения:
-- vim.notify = require("noice").notify
-- vim.lsp.handlers["textDocument/hover"] = require("noice").hover
-- vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature
