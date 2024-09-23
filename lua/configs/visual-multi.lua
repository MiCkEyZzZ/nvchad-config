local present, vm = pcall(require, "vim-visual-multi")

if not present then
  print "Не удалось загрузить vim-visual-multi"
  return
end

-- Настройка vim-visual-multi
vim.g.VM_show_warnings = 0
vim.g.VM_default_mappings = 0

vim.g.VM_maps = {
  ["Найдите под"] = "gb",
  ["Найдите подслово в разделе"] = "gb",
}

-- Дополнительные настройки могут быть добавлены здесь
