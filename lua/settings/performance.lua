local opt = vim.opt

-- Перерисовывать экран только при необходимости
vim.defer_fn(function()
  vim.o.lazyredraw = false
end, 0) -- Set it back immediately after the function runs
opt.updatetime = 300 -- Ускорение реакции на события
opt.signcolumn = "yes" -- Всегда показывать столбец с диагностикой знаков

return {}
