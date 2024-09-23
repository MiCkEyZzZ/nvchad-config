-- Проверяем, доступен ли модуль
local present, bqf = pcall(require, "bqf")

if not present then
  return
end

-- Настраиваем bqf
bqf.setup {
  auto_enable = true, -- Автоматически включается при входе в quickfix
  preview = {
    auto_preview = true, -- Включает предпросмотр результатов quickfix
    win_height = 15, -- Высота окна предпросмотра
    win_vheight = 15, -- Высота окна предпросмотра для вертикального сплита
    delay_syntax = 80, -- Задержка перед подцветкой синтаксиса
    border_chars = { "│", "│", "─", "─", "╭", "╮", "╯", "╰" }, -- Символы для границ окна предпросмотра
  },
  func_map = {
    open = "<CR>", -- Открыть запись из quickfix
    openc = "o", -- Открыть запись в новом сплите
    drop = "O", -- Открыть запись в текущем окне
    split = "<C-s>", -- Открыть в горизонтальном сплите
    tabdrop = "<C-t>", -- Открыть в новой вкладке
    tabc = "<C-x>", -- Закрыть вкладку
    prevfile = "<C-p>", -- Переключиться на предыдущий файл
    nextfile = "<C-n>", -- Переключиться на следующий файл
  },
  filter = {
    fzf = {
      action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
      extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
    },
  },
}
