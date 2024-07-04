-- Этот файл должен иметь ту же структуру, что и nvconfig.lua.
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "github_light",
  theme_toggle = { "github_dark", "github_light" },
  transparency = false,
  load_on_startup = true,
  -- Чтобы соответствовать nvim-tree
  tabufline = {
		order = { "buffers", "tabs", "btns" }, -- Добавьте «treeOffset», если вы не используете nvimTreeee в качестве всплывающего окна.
	},
  term = {
		-- hl = "Обычный:term,WinSeparator:WinSeparator",
		-- sizes = { sp = 0.3, vsp = 0.2 },
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

    buttons = {
      { "  Найти файл", "Spc f f", "Telescope find_files" },
      { "󰈚  Последние файлы", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Найти по слову", "Spc f w", "Telescope live_grep" },
      { "  Закладки", "Spc m a", "Telescope marks" },
      { "  Темы", "Spc t h", "Telescope themes" },
      { "  Управление", "Spc c h", "NvCheatsheet" },
    },
  },
  -- просто/сетка
  cheatsheet = { theme = "grid" },

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
