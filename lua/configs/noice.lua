local present, noice = pcall(require, "noice")
if not present then
  print("Не удалось загрузить noice.nvim: " .. tostring(noice))
  return
end

noice.setup {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = { enabled = false }, -- Отключаем всплывающее окно с hover
    signature = { enabled = false }, -- Отключаем подписи
    message = { enabled = true },
    documentHighlight = { enabled = false },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true,
  },
  routes = {
    {
      filter = { event = "msg_show" },
      opts = { skip = true },
    },
  },
}

-- Обработка уведомлений и LSP
vim.notify = noice.notify
vim.lsp.handlers["textDocument/hover"] = noice.hover
vim.lsp.handlers["textDocument/signatureHelp"] = noice.signature
