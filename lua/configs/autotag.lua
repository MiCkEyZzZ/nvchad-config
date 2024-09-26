local present, autotag = pcall(require, "nvim-ts-autotag")

if not present then
  print "Не удалось загрузить nvim-ts-autotag"
  return
end

autotag.setup {
  autotag = {
    enable = true, -- Основной параметр для включения плагина
  },
  filetypes = { -- Укажите, для каких типов файлов включить поддержку
    "html",
    "xml",
    -- Добавьте другие необходимые типы файлов
  },
  skip_tags = { -- Укажите теги, которые нужно пропустить (опционально)
    "area",
    "base",
    "br",
    "col",
    "command",
    "embed",
    "hr",
    "img",
    "slot",
    "input",
    "param",
    "source",
    "track",
    "wbr",
  },
}
