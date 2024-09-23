local present, tailwind_fold = pcall(require, "tailwind-fold")

if not present then
  return
end

tailwind_fold.setup {
  ft = { "html", "twig" }, -- Поддержка для HTML и Twig файлов
  -- Вы можете добавить дополнительные настройки, если это необходимо
}
