local present, noice = pcall(require, "noice")
if not present then
  print "Не удалось загрузить noice.nvim"
  return
end

noice.setup {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true, -- Конвертация ввода в Markdown
      ["vim.lsp.util.stylize_markdown"] = true, -- Стилизация Markdown
      ["cmp.entry.get_documentation"] = true, -- Поддержка nvim-cmp для документации
    },
    hover = { enabled = false }, -- Отключаем всплывающее окно с hover
    signature = { enabled = false }, -- Отключаем подписи
    message = { enabled = true }, -- Включаем обработку сообщений LSP
    documentHighlight = { enabled = false }, -- Отключаем выделение документов
  },
  presets = {
    bottom_search = true, -- Использование нижней строки для поиска
    command_palette = true, -- Включение командной палитры
    long_message_to_split = true, -- Длинные сообщения в разделённом окне
    inc_rename = false, -- Отключение инкрементального переименования
    lsp_doc_border = true, -- Добавление рамки для документации LSP
  },
  routes = {
    {
      filter = { event = "msg_show" },
      opts = { skip = true }, -- Пропускать стандартные сообщения
    },
  },
}

-- Необязательно: можете также обрабатывать другие уведомления или сообщения
-- vim.notify = require("noice").notify
-- vim.lsp.handlers["textDocument/hover"] = require("noice").hover
-- vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature
