local present, gitignore = pcall(require, "gitignore")

if not present then
  print "Не удалось загрузить gitignore.nvim"
  return
end

gitignore.setup {
  -- Путь к файлу gitignore, который будет открываться
  file_path = ".gitignore",

  -- Опции для использования в качестве шаблона
  templates = {
    "Node.js",
    "Python",
    "Java",
    "Ruby",
  },

  -- Установка цвета для выделения
  highlight_color = "#FF0000",

  -- Включить или отключить автозаполнение
  auto_complete = true,
}
