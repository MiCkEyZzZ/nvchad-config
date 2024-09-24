local present, cmp = pcall(require, "cmp")
local luasnip = require "luasnip"
local lspkind = require "lspkind" -- убедитесь, что lspkind загружен

if not present then
  print "Не удалось загрузить nvim-cmp"
  return
end

-- Настройка nvim-cmp
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Расширение сниппетов
    end,
  },
  mapping = {
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }, -- Переход к следующему элементу
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }, -- Переход к предыдущему элементу
    ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- Прокрутка документации вниз
    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Прокрутка документации вверх
    ["<C-Space>"] = cmp.mapping.complete(), -- Запуск автозаполнения
    ["<C-e>"] = cmp.mapping.close(), -- Закрытие автозаполнения
    ["<CR>"] = cmp.mapping.confirm { select = true }, -- Подтверждение выбора
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item() -- Выбор следующего элемента
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump() -- Расширение или переход к сниппету
      else
        fallback() -- Обычное поведение Tab
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item() -- Выбор предыдущего элемента
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1) -- Переход к предыдущему сниппету
      else
        fallback() -- Обычное поведение Shift+Tab
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp", priority = 1000 }, -- Источник LSP
    { name = "luasnip", priority = 750 }, -- Источник сниппетов
    { name = "buffer", priority = 500 }, -- Источник из текущего буфера
    { name = "path", priority = 250 }, -- Источник из путей файлов
  },
  formatting = {
    format = function(entry, vim_item)
      -- Настройка формата отображения элементов с рамкой
      local menu_icon = {
        nvim_lsp = "LSP",
        luasnip = "LuaSnip",
        buffer = "Buffer",
        path = "Path",
      }
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind -- Добавление иконок
      vim_item.menu = "[" .. menu_icon[entry.source.name] .. "]" -- Подписи источников
      return vim_item
    end,
  },
  experimental = {
    ghost_text = true, -- Включение призрачного текста для улучшения визуализации
  },
}

-- Настройка внешнего вида рамки автозаполнения
vim.cmd [[
augroup CmpBorders
  autocmd!
  autocmd ColorScheme * highlight CmpItemAbbr guibg=NONE guifg=#888888
  autocmd ColorScheme * highlight CmpItemAbbrMatch guibg=NONE guifg=#ffffff
  autocmd ColorScheme * highlight CmpItemKind guibg=NONE guifg=#66d9ef
  autocmd ColorScheme * highlight CmpItemMenu guibg=NONE guifg=#f92672
augroup END
]]
