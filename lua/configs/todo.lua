local status, todo_comments = pcall(require, "todo-comments")
if not status then
  print "Не удалось загрузить todo-comments.nvim"
  return
end

todo_comments.setup {
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "ИСПРАВИТЬ", "ПРОБЛЕМА" },
    },
    TODO = {
      icon = " ",
      color = "info",
      alt = { "TO-DO", "СДЕЛАТЬ", "ПЛАН", "ЗАДАЧА" },
    },
    HACK = {
      icon = " ",
      color = "warning",
      alt = { "ХАК", "КОСТЫЛЬ", "WORKAROUND" },
    },
    WARN = {
      icon = " ",
      color = "warning",
      alt = { "ПРЕДУПРЕЖДЕНИЕ", "ВНИМАНИЕ", "ОСТОРОЖНО" },
    },
    PERF = {
      icon = " ",
      alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
    },
    NOTE = {
      icon = " ",
      color = "hint",
      alt = { "INFO", "ЗАМЕТКА", "ПРИМИЧАНИЕ" },
    },
    TEST = {
      icon = "⏲ ",
      color = "test",
      alt = { "TESTING", "ТЕСТИРОВАНИЕ", "PASSED", "ПРОЙДЕН", "FAILED" },
    },
    SECURITY = {
      icon = " ",
      color = "error",
      alt = { "SEC", "ВНИМАНИЕ" },
    },
    DEPRECATED = {
      icon = " ",
      color = "warning",
      alt = { "УСТАРЕВШЕЕ", "ОБНОВИТЬ" },
    },
  },
  gui_style = {
    fg = "NONE",
    bg = "BOLD",
  },
  merge_keywords = true,
  highlight = {
    multiline = true,
    multiline_pattern = "^.",
    multiline_context = 5,
    before = "",
    keyword = "wide",
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 200,
    exclude = { "markdown" },
  },
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    test = { "Identifier", "#FF00FF" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!**/node_modules/**",
      "--glob=!**/*.min.*",
      "--glob=!**/dist/**",
    },
    pattern = [[\b(KEYWORDS):]],
  },
}
