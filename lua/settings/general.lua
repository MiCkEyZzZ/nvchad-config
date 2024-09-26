-- Установка глобальных переменных
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.o.mouse = "a"

-- Активируем провайдеры
vim.g.loaded_node_provider = 1
vim.g.loaded_perl_provider = 1
vim.g.loaded_python3_provider = 1
vim.g.loaded_ruby_provider = 1

local opt = vim.opt

-- Настройки
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.backup = false
opt.swapfile = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.tabstop = 2
opt.shell = "zsh"
opt.inccommand = "split"
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.wrap = false -- никаких линий переноса
opt.wildignore:append { "*/node_modules/*" }
opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

return {}
