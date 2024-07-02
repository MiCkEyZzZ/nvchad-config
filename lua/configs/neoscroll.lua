local present, neoscroll = pcall(require, "neoscroll")

if not present then
  return
end

neoscroll.setup {
  -- Все эти клавиши будут сопоставлены с соответствующей им анимацией прокрутки по умолчанию
  mappings = {
    "<C-u>",
    "<C-d>",
    "<C-b>",
    "<C-f>",
    "<C-y>",
    "<C-e>",
    "zt",
    "zz",
    "zb",
  },
  hide_cursor = true, -- скрытие курсора при прокрутке
  stop_eof = true, -- остановка на <EOF> при прокрутке вниз
  use_local_scrolloff = false, -- используйте локальную область scrolloff вместо глобальной области
  respect_scrolloff = false, -- остановка прокрутки, когда курсор достигнет границы прокрутки файла
  cursor_scrolls_alone = true, -- курсор будет продолжать прокручиваться, даже если окно не сможет прокручиваться дальше
  easing_function = nil, -- по умолчанию easing function
  pre_hook = nil, -- функция, запускаемая перед запуском анимации прокрутки
  post_hook = nil, -- функция, запускаемая после завершения анимации прокрутки
}