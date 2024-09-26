local present, neoscroll = pcall(require, "neoscroll")

if not present then
  print "Не удалось загрузить neoscroll"
  return
end

-- Настройка времени анимации для каждого типа прокрутки
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

-- Настройка Neoscroll
neoscroll.setup {
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
  use_local_scrolloff = false, -- Использовать локальный scrolloff вместо глобального
  respect_scrolloff = false, -- Остановить прокрутку, когда курсор достигает границы scrolloff
  cursor_scrolls_alone = true, -- Курсор продолжает прокручиваться, даже если окно не может прокручиваться дальше
  easing_function = "quadratic", -- Функция сглаживания для плавной прокрутки
  pre_hook = function(info)
    print "Прокрутка началась"
  end,
  post_hook = function(info)
    print "Прокрутка завершена"
  end,
}

-- Установка пользовательских привязок
for key, value in pairs(t) do
  vim.api.nvim_set_keymap(
    "n",
    key,
    '<cmd>lua require("neoscroll").' .. value[1] .. "({ " .. table.concat(value[2], ", ") .. " })<CR>",
    { noremap = true, silent = true }
  )
end
