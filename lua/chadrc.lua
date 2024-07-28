-- Этот файл должен иметь ту же структуру, что и nvconfig.lua.
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "github_light", "nord", "tokyonight" },
  transparency = false,
  load_on_startup = true,
  -- Чтобы соответствовать nvim-tree
  tabufline = {
    order = { "buffers", "tabs", "btns", "treeOffset" }, -- Добавьте «treeOffset», если вы не используете nvimTreeee в качестве всплывающего окна.
  },
  term = {
    -- hl = "Обычный:term,WinSeparator:WinSeparator",
    -- sizes = { sp = 0.3, vsp = 0.2 },
    font = "FiraCode Nerd Font:h14", -- шрифт для терминала
    size = 20,
    position = "center",
    float = {
      relative = "editor",
      row = 0.1,
      col = 0.045,
      width = 0.9,
      height = 0.8,
      border = "single",
    },
  },
  statusline = {
    theme = "vscode_colored",
    separator_style = "round",
    sections = { -- добавлены секции для более детальной настройки
      left = { "mode", "branch", "diff" },
      mid = { "filename" },
      right = { "fileformat", "fileencoding", "filetype" },
    },
  },
  nvdash = {
    load_on_startup = true,
    header = {
      [[                                           /$$   /$$                ]],
      [[  /$$   /$$  /$$$$$$   /$$$$$$  /$$$$$$$  / $$  /$$$  /$$$$$$/$$$$  ]],
      [[ | $$  | $$ /$$__  $$ /$$__  $$| $$  | $$ | $$ /$$$$ | $$_  $$_  $$ ]],
      [[ | $$  | $$| $$$$$$$$| $$  \ $$| $$$$$$$$ | $$$$/ $$ | $$ \ $$ \ $$ ]],
      [[ | $$$$$$$$| $$_____/| $$  | $$| $$  | $$ | $$$ | $$ | $$ | $$ | $$ ]],
      [[ | $$  | $$|  $$$$$$$|  $$$$$$/| $$$$$$$/ | $$  | $$ | $$ | $$ | $$ ]],
      [[ | $$  | $$ \_______/ \______/  \______/  |__/  |__/ |__/ |__/ |__/ ]],
      [[ | $$  | $$                                                         ]],
      [[ |__/  |__/                                                         ]],
      [[                                                                    ]],
    },

    -- Установка меню
    buttons = {
      { "  Найти файл", "Проб f f", "Telescope find_files" },
      { "󰈚  Последние файлы", "Проб f o", "Telescope oldfiles" },
      { "󰈭  Найти по слову", "Проб f w", "Telescope live_grep" },
      { "  Закладки", "Проб m a", "Telescope marks" },
      { "  Темы", "Проб t h", "Telescope themes" },
      { "  Управление", "Проб c h", "NvCheatsheet" },
    },
  },
  -- просто/сетка
  cheatsheet = { theme = "grid" }, -- простая/сетка

  telescope = { style = "bordered" },
  extended_integrations = { "notify", "dashboard", "lualine" }, -- добавлены новые инеграции

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    DiffChange = {
      bg = "#464414",
      fg = "none",
    },
    DiffAdd = {
      bg = "#103507",
      fg = "none",
    },
    DiffRemoved = {
      bg = "#ff7e00",
      fg = "none",
    },
  },
}

return M
