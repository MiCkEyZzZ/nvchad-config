local present, neoscroll = pcall(require, "neoscroll")

if not present then
  return
end

-- Таблица с настройками времени анимации для каждого типа прокрутки
local t = {}
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "100" } }
t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "200" } }
t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "200" } }
t["<C-y>"] = { "scroll", { "-0.10", "false", "50" } }
t["<C-e>"] = { "scroll", { "0.10", "false", "50" } }
t["zt"] = { "zt", { "100" } }
t["zz"] = { "zz", { "100" } }
t["zb"] = { "zb", { "100" } }

neoscroll.setup {
  -- Все эти клавиши будут привязаны к соответствующей анимации прокрутки
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
  hide_cursor = true, -- Скрыть курсор во время прокрутки
  stop_eof = true, -- Остановить на <EOF> при прокрутке вниз
  use_local_scrolloff = false, -- Использовать локальный scope scrolloff вместо глобального
  respect_scrolloff = false, -- Остановить прокрутку, когда курсор достигает границы scrolloff
  cursor_scrolls_alone = true, -- Курсор продолжит прокручиваться, даже если окно не может прокручиваться дальше
  easing_function = "quadratic", -- Включение функции сглаживания для плавной прокрутки
  pre_hook = function(info)
    -- Пример функции, которая будет запускаться перед началом анимации прокрутки
    print "Прокрутка началась"
  end,
  post_hook = function(info)
    -- Пример функции, которая будет запускаться после окончания анимации прокрутки
    print "Прокрутка завершена"
  end,
}

-- Настройка времени анимации
require("neoscroll.config").set_mappings(t)

