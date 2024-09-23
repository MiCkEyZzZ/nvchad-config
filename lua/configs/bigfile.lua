-- файл: lua/configs/bigfile.lua
local present, bigfile = pcall(require, "bigfile")

if not present then
  print "Не удалось загрузить bigfile.nvim"
  return
end

bigfile.setup {
  filesize = 2, -- размер файла в MiB
}
