local present, lualine = pcall(require, "lualine")

if not present then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "nord", -- использование lualine темы
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {}, -- типы файлов, игнорируемые для статусной строки
      winbar = {}, -- типы файлов, игнорируемые для winbar
    },
    ignore_focus = {},
    always_divide_middle = true, -- если true, левая часть (a, b, c) всегда разделена
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      "branch",
      "diff",
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        sections = { "error", "warn", "info", "hint" },
        diagnostics_color = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint",
        },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        colored = true, -- включить цвета по умолчанию
        update_in_insert = false,
        always_visible = false,
      },
    },
    lualine_c = {
      "filename",
      {
        "filesize",
        cond = function()
          return vim.fn.empty(vim.fn.expand "%:t") ~= 1
        end,
      },
    },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {},
}

