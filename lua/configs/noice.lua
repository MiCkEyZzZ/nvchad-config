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
    hover = { enabled = false }, -- Отключаем отображение hover
    signature = { enabled = false }, -- Отключаем отображение подписи
  },
  presets = {
    bottom_search = true, -- Используем классическую нижнюю строку команды для поиска
    command_palette = true, -- Располагаем командную строку и всплывающее меню вместе
    long_message_to_split = true, -- Длинные сообщения будут отправлены в разделенный
    inc_rename = false, -- Включает диалоговое окно ввода для inc-rename.nvim
    lsp_doc_border = false, -- Добавьте рамку для наведения курсора мыши на документы и справку о подписи
  },
}

-- (Необязательно) Настройка уведомлений
-- vim.notify = require("noice").notify
-- vim.lsp.handlers["textDocument/hover"] = require("noice").hover
-- vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature
