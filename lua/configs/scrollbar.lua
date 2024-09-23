local present, scrollbar = pcall(require, "scrollbar")

if not present then
  print "Не удалось загрузить nvim-scrollbar"
  return
end

scrollbar.setup {
  -- Настройки scrollbar
  handlers = {
    cursor = true, -- Показывать положение курсора
    diagnostic = true, -- Показывать диагностические сообщения
    gitsigns = true, -- Показывать изменения в git
    handle = true, -- Настройка для отображения обрабатываемых объектов
  },
  excluded_filetypes = { -- Исключенные типы файлов
    "help",
    "dashboard",
    "NvimTree",
    "packer",
  },
  -- Добавьте другие настройки по желанию
}
