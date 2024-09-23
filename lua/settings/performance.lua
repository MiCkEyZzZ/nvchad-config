local opt = vim.opt

opt.lazyredraw = true -- Перерисовывать экран только при необходимости
opt.updatetime = 300 -- Ускорение реакции на события
opt.signcolumn = "yes" -- Всегда показывать столбец с диагностикой знаков

return {}
