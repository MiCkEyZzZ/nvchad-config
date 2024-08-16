return {
  -- лёгкий, но мощный модуль форматирования для Neovim.
  -- подробнее смотри: https://github.com/prettier/vim-prettier
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  -- tmux плагин позволит легко перемещаться между разделениями vim и tmux
  -- подробнее смотри: https://github.com/christoomey/vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  -- плагин для удобного взаимодействия с окнами
  -- подробнее смотри: https://github.com/stevearc/dressing.nvim
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- opti onal packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup {
        go = "go",
        gofmt = "gofumpt", -- Если хотите использовать gofmt, установите значение "gofmt"
        fillstruct = "gopls",
        tag_transform = false,
        test_dir = "",
        comment_placeholder = "",
        verbose = false,
        tag_options = "json=omitempty",
        icons = { breakpoint = "🧘", currentpos = "🏃" },
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  -- библиотека для асинхронного ввода-вывода в Neovim, созданная на основе библиотеки asyncio в Python.
  -- Библиотека ориентирована на предоставление как обычных асинхронных примитивов, так и асинхронных API для ядра Neovim.
  -- подробнее смотри:  https://github.com/nvim-neotest/neotest
  { "nvim-neotest/nvim-nio" },

  -- портативный менеджер пакетов для Neovim, который работает везде, где работает Neovim.
  -- подробнее смотри: https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint-lsp",
        "clangd",
        "clang-format",
        "gopls",
        "js-debug-adapter",
        "typescript-language-server",
        "dockerls",
        "yamlls",
        "jsonls",
        "marksman",
        "protols",
      },
    },
  },

  -- конфигурации Nvim Treesitter и уровень абстракции.
  -- предоставляет простой и понятный способ использования интерфейса для tree-sitter в Neovim
  -- подробнее смотри: https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "vim",
          "lua",
          "vimdoc",
          "html",
          "css",
          "typescript",
          "javascript",
          "go",
          "c",
          "cpp",
          "json",
          "yaml",
          "markdown",
          "rust",
          "proto",
          "prisma",
          "sql",
          "toml",
          "json",
          "ruby",
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
      }
    end,
  },

  -- асинхронный плагин linter для Neovim, дополняющий встроенную поддержку протокола языкового сервера.
  -- подробнее смотри: https://github.com/jose-elias-alvarez/null-ls.nvim
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },

  -- используйте treesitter для автоматического закрытия и переименования html-тега.
  -- подробнее смотри: https://github.com/windwp/nvim-ts-autotag
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          -- Значения по умолчанию
          enable_close = true, -- Автоматическое закрытие тегов
          enable_rename = true, -- Автоматическое переименование пар тегов
          enable_close_on_slash = false, -- Автоматическое закрытие при замыкании </
        },
      }
    end,
  },

  -- плагин представляет собой lua-версию better_escape.vim, с некоторыми дополнительными функциями и оптимизациями.
  -- подробнее смотри: https://github.com/max397574/better-escape.nvim
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require "configs.better-escape"
    end,
  },

  -- Hop - это плагин, похожий на EasyMotion, который позволяет вам переходить в любое место документа
  -- с минимальным количеством нажатий клавиш.
  -- подробнее смотри: https://github.com/phaazon/hop.nvim
  {
    "phaazon/hop.nvim",
    event = "BufReadPost",
    branch = "v2",
    config = function()
      require "configs.hop"
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require "configs.illuminate"
    end,
  },

  -- плавная прокрутка при скролинге
  -- подробнее смотри: https://github.com/karb94/neoscroll.nvim
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPost",
    config = function()
      require "configs.neoscroll"
    end,
  },

  -- плагин связан с манипуляцией ковычками, скобками. Позволяет удалять, изменять и добавлять
  -- подробнее смотри: https://github.com/tpope/vim-surround
  {
    "tpope/vim-surround",
    event = "BufReadPost",
  },

  -- плагин с несколькими курсорами для vim/neovim
  -- подробнее смотри: https://github.com/mg979/vim-visual-multi
  {
    "mg979/vim-visual-multi",
    event = "BufReadPost",
    init = function()
      require "configs.visual-multi"
    end,
  },

  -- фреймворк для взаимодействия с тестами в рамках NeoVim.
  -- подробнее смотри: https://github.com/nvim-neotest/neotest
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-jest" {
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.ts",
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
  },

  -- настройка DAP для нативного дебаггера
  -- подробнее смотри: https://github.com/mfussenegger/nvim-dap
  {
    "mfussenegger/nvim-dap",
    config = function()
      local ok, dap = pcall(require, "dap")
      if not ok then
        return
      end
      dap.configurations.typescript = {
        {
          type = "node2",
          name = "node attach",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
        },
      }
      dap.adapters.node2 = {
        type = "executable",
        command = "node-debug2-adapter",
        args = {},
      }
    end,
    dependencies = {
      "mxsdev/nvim-dap-vscode-js",
    },
  },

  -- поддержка Tailwind CSS в NeoVim
  {
    "razak17/tailwind-fold.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    config = function()
      require("tailwind-fold").setup { ft = { "html", "twig" } }
    end,
  },

  -- интерфейс для DAP (нативный дебаггер)
  -- подробнее смотри: https://github.com/rcarriga/nvim-dap-ui
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()

      local dap, dapui = require "dap", require "dapui"

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close {}
      end
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  -- поддержка neodev для упрощения разработки
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },

  { "tpope/vim-fugitive" },

  { "rbong/vim-flog", dependencies = {
    "tpope/vim-fugitive",
  }, lazy = false },

  { "sindrets/diffview.nvim", lazy = false },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },

  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },

  -- плагин показывает ошибки в коде
  -- подробнее смотри: https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh",
          },
        },
        -- глобально включить разные цвета подсветки для каждого значка (по умолчанию установлено значение true)
        -- если установлено значение false, все значки будут иметь цвет значка по умолчанию.
        color_icons = true,
        -- глобально включить значки по умолчанию (значение по умолчанию равно false)
        -- -- будет заменено параметром `get_icons`
        default = false,
        -- глобально включить "строгий" выбор значков - значок будет искать в разных таблицах,
        -- сначала по имени файла, а если не найден, то по расширению; это предотвращает случаи,
        -- когда файл не имеет расширения, но все равно имеет какой-либо значок
        -- потому что его имя случайно совпало с каким-то расширением (по умолчанию - false).
        strict = true,
        -- то же, что и `override`, но специально для переопределений по имени файла
        -- вступает в силу, если значение `strict` равно true
        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore",
          },
        },
        -- то же, что и "переопределение", но специально для переопределений по расширению
        -- вступает в силу, когда значение "strict" равно true
        override_by_extension = {
          ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log",
          },
        },
      }
    end,
  },
  -- плагин предназначен для выделения и поиска комментариев к задачам,
  -- таких как TODO, ВЗЛОМ, ОШИБКА в вашей кодовой базе
  -- подробнее смотри: https://github.com/folke/todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("todo-comments").setup {
        signs = true, -- отображать значки в столбце "знаки"
        sign_priority = 8, -- приоритет знака
        keywords = {
          FIX = {
            icon = " ", -- значок, используемый для вывески и в результатах поиска
            color = "error", -- может быть шестнадцатеричным цветом или именованным цветом (см. ниже).
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "ИСПРАВИТЬ" }, -- набор других ключевых слов, которые все соответствуют этому FIX ключевых слов
            -- signs = false, -- настраивать знаки для некоторых ключевых слов индивидуально
          },
          TODO = {
            icon = " ",
            color = "info",
            alt = { "СДЕЛАТЬ", "НАСТРОИТЬ", "ИСПОЛНИТЬ" },
          },
          HACK = { icon = " ", color = "warning", alt = { "ХАК", "КОСТЫЛЬ" } },
          WARN = {
            icon = " ",
            color = "warning",
            alt = { "ПРЕДУПРЕЖДЕНИЕ", "XXX" },
          },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = {
            icon = "⏲ ",
            color = "test",
            alt = {
              "TESTING",
              "ТЕСТИРОВАНИЕ",
              "PASSED",
              "ПРОЙДЕН",
              "FAILED",
            },
          },
        },
        gui_style = {
          fg = "NONE", -- Стиль графического интерфейса, который будет использоваться для группы выделения fg.
          bg = "BOLD", -- Стиль графического интерфейса, который будет использоваться для группы выделения bg.
        },
        merge_keywords = true, -- при значении true пользовательские ключевые слова будут объединены со значениями по умолчанию
        -- выделение строки, содержащей комментарий к задаче
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        highlight = {
          multiline = true, -- включить многострочные комментарии к задачам
          multiline_pattern = "^.", -- шаблон lua, соответствующий следующей многострочной строке с начала соответствующего ключевого слова
          multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
          before = "", -- "fg" or "bg" or empty
          keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
          after = "fg", -- "fg" or "bg" or empty
          pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
          comments_only = true, -- uses treesitter to match keywords in comments only
          max_line_len = 400, -- ignore lines longer than this
          exclude = {}, -- list of file types to exclude highlighting
        },
        -- список именованных цветов, в котором мы пытаемся извлечь графический интерфейс из
        -- список выделенных групп или используйте шестнадцатеричный цвет, если hl не найден, в качестве запасного варианта
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
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
          },
          -- регулярное выражение, которое будет использоваться для подбора ключевых слов.
          -- не заменяйте заполнитель (КЛЮЧЕВЫЕ слова)
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
      }
    end,
  }, -- чтобы плагин не загружался

  -- нативный плагин Codeium для Neovim.
  -- подробнее смотри: https://github.com/Exafunction/codeium.nvim
  {
    "Exafunction/codeium.vim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    lazy = false,
  },

  -- плагин позволяет быстро выделять любой фрагмент кода и создать красивый снимок кода
  -- прямо из терминала. Включить режим выделения можно нажав на клавишу v после этого
  -- перемещаясь стрелками по необходимой области кода.
  -- подробнее смотри: https://github.com/ellisonleao/carbon-now.nvim
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    opts = {},
  },

  -- невероятно быстрая и простая в настройке строка состояния Neovim, написанная на Lua.
  -- подробнее смотри: https://github.com/nvim-lualine/lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.lualine"
    end,
  },

  -- одна из темных тем для Neovim, вдохновленных Solarized, написанная на Lua.
  -- подробнее смотри: https://github.com/craftzdog/solarized-osaka.nvim?tab=readme-ov-file
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup {
        transparent = true, -- включите эту опцию, чтобы отключить настройку цвета фона
        terminal_colors = true, -- Настройте цвета, используемые при открытии ":терминала" в [Neovim](https://github.com/neovim/neovim)
        styles = {
          -- стиль, который будет применяться к различным синтаксическим группам
          -- значение - это любое допустимое значение attrlist для `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
        },
      }
    end,
  },

  -- плагин показывает подсказки в виде всплывающих окон.
  -- подробнее смотри: https://github.com/ray-x/lsp_signature.nvim
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  -- автодополнения с выбором элементов с помощью стрелок
  -- подробности: https://github.com/hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require "configs.cmp"
    end,
  },
  -- предварительный просмотр Markdown в вашем современном браузере
  -- с синхронизированной прокруткой и гибкой настройкой.
  -- подробности: https://github.com/iamcco/markdown-preview.nvim
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    lazy = false,
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_theme = "dark"
    end,
  },
  -- простая и быстрая полоса прокрутки для Neovim. Она намеренно лишена
  -- каких-либо особенностей и останется таковой.
  -- подробнее смотри: https://github.com/ojroques/nvim-scrollbar
  {
    "ojroques/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      require("scrollbar").setup {}
    end,
  },
}
