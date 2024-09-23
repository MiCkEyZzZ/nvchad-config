local status, carbon_now = pcall(require, "carbon-now")
if not status then
  print "Не удалось загрузить carbon-now.nvim"
  return
end

-- Настройки для carbon-now
carbon_now.setup {
  -- Опции настройки по умолчанию
  -- Например, вы можете указать свой собственный URL для API или изменить другие параметры
  -- url = "https://carbon.now.sh", -- можно указать свой URL
  -- другие опции могут быть добавлены здесь
}
