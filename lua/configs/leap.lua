-- Проверяем, доступен ли модуль
local present, leap = pcall(require, "leap")

if not present then
  return
end

-- Настраиваем leap с дефолтными маппингами
leap.add_default_mappings(true)
