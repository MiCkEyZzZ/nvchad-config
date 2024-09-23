local status, solarized = pcall(require, "solarized-osaka")
if not status then
  print "Не удалось загрузить solarized-osaka.nvim"
  return
end

-- Настройка solarized-osaka
solarized.setup {
  transparent = true, -- Отключить настройку цвета фона
  terminal_colors = true, -- Настройка цветов для терминала
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
  },
}

-- Установка темы
vim.cmd "colorscheme solarized"
