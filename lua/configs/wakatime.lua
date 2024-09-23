-- configs/wakatime.lua
local present, wakatime = pcall(require, "wakatime")

if not present then
  print "Не удалось загрузить vim-wakatime"
  return
end

-- Дополнительные настройки для Wakatime (если нужны)
wakatime.setup {
  -- Пример: включить уведомления
  -- notify = true,
}
