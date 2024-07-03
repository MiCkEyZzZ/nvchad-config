local present, lualine = pcall(require, "lualine")

if not present then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'nord',-- lualine тема
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { -- типы файлов, для которых нужно отключить lualine.
      statusline = {},     -- игнорируется только значение ft для строки состояния.
      winbar = {},         -- игнорируется только значение ft для winbar.
    },
    ignore_focus = {},
    always_divide_middle = true, -- если установлено значение true, левые разделы, т.е. "a", "b" и "c"
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}