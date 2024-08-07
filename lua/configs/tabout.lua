local present, tabout = pcall(require, "tabout")

if not present then
  return
end

tabout.setup {
  tabkey = "<Tab>", -- клавиша для запуска табуляции, установленная в пустую строку для отключения
  backwards_tabkey = "<S-Tab>", -- клавиша для запуска обратной вкладки поддержки git в nvimtree, установленная в пустую строку для отключения
  act_as_tab = true, -- переместить содержимое, если выход из табуляции невозможен
  act_as_shift_tab = false, -- переключение содержимого в обратном порядке, если использование tab out невозможно (если ваша клавиатура / терминал поддерживает <S-Tab>)
  default_tab = "<C-t>", -- сдвинуть действие по умолчанию (только в начале строки, в противном случае используется <ТАБУЛЯЦИЯ>)
  default_shift_tab = "<C-d>", -- действие обратного сдвига по умолчанию
  enable_backwards = true, -- well ...
  completion = true, -- если клавиша tab используется в pum завершения
  tabouts = {
    { open = "'", close = "'" },
    { open = '"', close = '"' },
    { open = "`", close = "`" },
    { open = "(", close = ")" },
    { open = "[", close = "]" },
    { open = "{", close = "}" },
    { open = "<", close = ">" },
  },
  ignore_beginning = false, --[[ если курсор находится в начале заполненного элемента, он скорее уберет табуляцию, чем переместит содержимое ]]
  exclude = { "markdown", "json" }, -- tabout будет игнорировать эти типы файлов
}
