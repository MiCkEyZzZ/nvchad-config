require "nvchad.options"

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- добавляйте свои сюда!
-- local o = vim.o
-- o.cursorlineopt ='both' -- чтобы включить cursorline!

-- Общие опции
local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Настройки дисплея
o.cursorline = true -- Включить выделение строки с курсором
wo.cursorlineopt = "both" -- Настройка режима выделения строки

o.number = true -- Включить нумерацию строк
o.relativenumber = true -- Включить относительные номера строк
o.wrap = false -- Выключить перенос строк

-- Настройки редактирования
o.tabstop = 2 -- Количество пробелов по умолчанию для табуляции
o.shiftwidth = 2 -- Размер отступа для команд
o.expandtab = true -- Преобразование табуляции в пробелы
o.smartindent = true -- Умный отступ

-- Поиск
o.ignorecase = true -- Игнорировать регистр при поиске
o.smartcase = true -- Если есть заглавные буквы в запросе поиска, учитывать регистр
o.incsearch = true -- Показывать совпадения по мере ввода
o.hlsearch = true -- Подсвечивать все совпадения поиска

-- Мышь
o.mouse = "a" -- Включить поддержку мыши

-- Буфер файлов
bo.autoread = true -- Автоматически читать при изменении файла на диске

-- Добавьте свои параметры сюда!
-- Пример:
-- o.timeoutlen = 300    -- Установка таймаута для команд

-- Пользовательские дополнительные опции
-- o.completeopt = 'menuone,noselect'
-- o.termguicolors = true -- Включить 24-битную поддержку цвета для терминала

-- Параметры производительности
vim.opt.lazyredraw = true -- Перерисовывать экран только при необходимости
vim.opt.updatetime = 300 -- Ускорение реакции на события

-- Параметры отображения
vim.opt.signcolumn = "yes" -- Всегда показывать столбец с диагностикой знаков

vim.opt.lazyredraw = true -- Перерисовывать экран только при необходимости
vim.opt.updatetime = 250 -- Ускорение реакции на события

vim.opt.ignorecase = true -- Игнорировать регистр при поиске
vim.opt.smartcase = true -- Если есть заглавные буквы в запросе поиска, учитывать регистр

vim.wo.number = true
vim.wo.relativenumber = true
