local present, autotag = pcall(require, "nvim-ts-autotag")

if not present then
  print "Не удалось загрузить nvim-ts-autotag"
  return
end

autotag.setup {
  opts = {
    enable_close = true, -- Автоматическое закрытие тегов
    enable_rename = true, -- Автоматическое переименование пар тегов
    enable_close_on_slash = false, -- Автоматическое закрытие при замыкании </
  },
  per_filetype = {
    ["html"] = {
      enable_close = false, -- Отключение автозакрытия для HTML
    },
  },
}
