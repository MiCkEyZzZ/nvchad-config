local present, comment = pcall(require, "Comment")
if not present then
  return
end

local function get_commentstring()
  local ft = vim.bo.filetype
  -- Для Go файлов используем однострочные комментарии
  if ft == "go" then
    return "// %s"
  -- Добавить другие языки по необходимости
  elseif ft == "lua" or ft == "vim" then
    return "-- %s"
  elseif ft == "javascript" or ft == "typescript" then
    return "// %s"
  else
    -- Стандартные настройки
    return vim.bo.commentstring
  end
end

comment.setup {
  mappings = {
    basic = true, -- Включает базовые сочетания клавиш
    extra = true, -- Включает дополнительные сочетания
  },
  pre_hook = function(ctx)
    -- Установить правильный commentstring для текущего буфера
    vim.bo.commentstring = get_commentstring()

    -- Определяем, блочный это или однострочный комментарий
    local U = require "Comment.utils"
    if ctx.ctype == U.ctype.block then
      return "--[[", "--]]"
    else
      return vim.bo.commentstring, ""
    end
  end,
}
