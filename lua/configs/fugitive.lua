-- Проверяем наличие плагина
local present, fugitive = pcall(require, "fugitive")

if not present then
  return
end

-- Здесь можно добавить любые команды или настройки, если нужно
-- Например, добавить кастомные команды для git в vim
vim.cmd [[
  command! -nargs=* GitFetch Git fetch <args>
  command! -nargs=* GitPull Git pull <args>
]]
