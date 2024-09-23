-- Проверяем наличие плагина
local present, flog = pcall(require, "flog")

if not present then
  return
end

-- Здесь можно добавить кастомные команды для удобства
vim.cmd [[
  command! FlogToggle :Flog
  command! FlogOpen :Flogsplit
]]
