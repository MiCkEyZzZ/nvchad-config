return {
  -- лёгкий, но мощный модуль форматирования для Neovim.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/prettier/vim-prettier
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  -- tmux плагин позволит легко перемещаться между разделениями vim и tmux
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/christoomey/vim-tmux-navigator
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
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/stevearc/dressing.nvim
  {
    "stevearc/dressing.nvim",
    lazy = false,
    config = function()
      require "configs.dressing"
    end,
  },
  -- плагин для Neovim, который предоставляет визуальные индикаторы изменений
  -- в коде
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/stevearc/dressing.nvim
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function()
      require "configs.gitsigns"
    end,
  },
  -- плагин предназначена для настройки языковых серверов в Neovim, что позволяет
  -- улучшить
  -- опыт разработки за счет интеграции функций Language Server Protocol (LSP)
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- плагин нужен, если вы работаете с языком Go и хотите улучшить свой опыт
  -- разработки
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/ray-x/go.nvim
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require "configs.go" -- Подключаем вашу конфигурацию
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- Обновление всех бинарных файлов
  },
  -- библиотека для асинхронного ввода-вывода в Neovim, созданная на основе библиотеки
  -- asyncio
  -- в Python. Библиотека ориентирована на предоставление как обычных асинхронных
  -- примитивов,
  -- так и асинхронных API для ядра Neovim.
  -- ПРИМИЧАНИЕ: подробнее смотри:  https://github.com/nvim-neotest/neotest
  {
    "nvim-neotest/nvim-nio",
    config = function()
      require "configs.nio" -- Подключаем вашу конфигурацию
    end,
  },
  -- портативный менеджер пакетов для Neovim, который работает везде, где работает
  -- Neovim.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/williamboman/mason.nvim
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
        "pyright",
        "mypy",
        "ruff",
        "black",
        "marksman",
        "gofumpt",
      },
    },
  },
  -- конфигурации Nvim Treesitter и уровень абстракции.
  -- предоставляет простой и понятный способ использования интерфейса для tree-sitter
  -- в Neovim
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require "configs.treesitter"
    end,
  },
  -- асинхронный плагин linter для Neovim, дополняющий встроенную поддержку протокола
  -- языкового сервера.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/jose-elias-alvarez/null-ls.nvim
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },
  -- используйте treesitter для автоматического закрытия и переименования html-тега.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/windwp/nvim-ts-autotag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require "configs.autotag"
    end,
  },
  -- плагин представляет собой lua-версию better_escape.vim, с некоторыми дополнительными
  -- функциями и оптимизациями.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/max397574/better-escape.nvim
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require "configs.better-escape"
    end,
  },
  -- плагин, похожий на EasyMotion, который позволяет вам переходить в любое
  -- место документа
  -- с минимальным количеством нажатий клавиш.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/phaazon/hop.nvim
  {
    "phaazon/hop.nvim",
    event = "BufReadPost",
    branch = "v2",
    config = function()
      require "configs.hop"
    end,
  },
  -- плагин служит для подсветки всех вхождений слова под курсором в редакторе.
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/RRethy/vim-illuminate
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require "configs.illuminate"
    end,
  },
  -- плавная прокрутка при скролинге
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/karb94/neoscroll.nvim
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPost",
    config = function()
      require "configs.neoscroll"
    end,
  },
  -- плагин связан с манипуляцией ковычками, скобками. Позволяет удалять, изменять
  -- и добавлять
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/tpope/vim-surround
  {
    "tpope/vim-surround",
    event = "BufReadPost",
  },
  -- плагин с несколькими курсорами для vim/neovim
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/mg979/vim-visual-multi
  {
    "mg979/vim-visual-multi",
    event = "BufReadPost",
    init = function()
      require "configs.visual-multi"
    end,
  },
  -- фреймворк для взаимодействия с тестами в рамках NeoVim.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/nvim-neotest/neotest
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    config = function()
      require "configs.neotest"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
  },
  -- настройка DAP для нативного дебаггера
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/mfussenegger/nvim-dap
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
    dependencies = {
      "mxsdev/nvim-dap-vscode-js",
    },
  },
  -- интерфейс для DAP (нативный дебаггер)
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/rcarriga/nvim-dap-ui
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    config = function()
      require "configs.dap-ui"
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  -- плагин Neovim для сокрытия длинных атрибутов класса.
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/razak17/tailwind-fold.nvim
  {
    "razak17/tailwind-fold.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require "configs.tailwind-fold"
    end,
  },
  -- поддержка neodev для упрощения разработки
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/folke/neodev.nvim
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.neodev"
    end,
  },
  -- плагин Vim для Git
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/tpope/vim-fugitive
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      require "configs.fugitive"
    end,
  },
  -- плагин невероятно быстрый, потрясающе красивый и исключительно мощный
  -- инструмент для просмотра веток Git для Vim/Neovim.
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/rbong/vim-flog
  {
    "rbong/vim-flog",
    dependencies = {
      "tpope/vim-fugitive",
    },
    lazy = false, -- Загружается при старте, так как lazy = false
    config = function()
      require "configs.flog"
    end,
  },
  -- плагин для работы с git-диффами
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/sindrets/diffview.nvim
  {
    "sindrets/diffview.nvim",
    lazy = false, -- Загружается при старте
    config = function()
      require "configs.diffview"
    end,
  },
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/ggandor/leap.nvim
  {
    "ggandor/leap.nvim",
    lazy = false, -- Загружается при старте
    config = function()
      require "configs.leap"
    end,
  },
  -- это расширение для работы с quickfix-окнами в Neovim. Quickfix позволяет
  -- отображать результаты поиска и ошибок в отдельном окне, а bqf улучшает
  -- его функциональность
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/kevinhwang91/nvim-bqf
  {
    "kevinhwang91/nvim-bqf",
    lazy = false, -- Плагин загружается сразу при старте
    config = function()
      require "configs.bqf"
    end,
  },
  -- плагин для улучшенной визуализации диагностических сообщений (ошибок,
  -- предупреждений, информации и подсказок) в вашем проекте.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
    lazy = false, -- Плагин загружается сразу при старте
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Зависимость для иконок
    config = function()
      require "configs.trouble"
    end,
  },
  -- плагин предназначен для выделения и поиска комментариев к задачам,
  -- таких как TODO, ВЗЛОМ, ОШИБКА в вашей кодовой базе
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/folke/todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require "configs.todo"
    end,
  },
  -- нативный плагин Codeium для Neovim.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/Exafunction/codeium.nvim
  {
    "Exafunction/codeium.vim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require "configs.codeium"
    end,
  },
  -- плагин позволяет быстро выделять любой фрагмент кода и создать красивый снимок кода
  -- прямо из терминала. Включить режим выделения можно нажав на клавишу v после этого
  -- перемещаясь стрелками по необходимой области кода.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/ellisonleao/carbon-now.nvim
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    config = function()
      require "configs.carbon-now"
    end,
  },
  -- невероятно быстрая и простая в настройке строка состояния
  -- Neovim, написанная на Lua.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/nvim-lualine/lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.lualine"
    end,
  },
  -- плагин показывает подсказки в виде всплывающих окон.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/ray-x/lsp_signature.nvim
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.lsp_signature"
    end,
  },
  -- автодополнения с выбором элементов с помощью стрелок
  -- ПРИМИЧАНИЕ: подробности: https://github.com/hrsh7th/nvim-cmp
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
      vim.fn["mkdp#util#install"]() -- Установка необходимых зависимостей для плагина
    end,
    config = function()
      require "configs.markdown_preview" -- Подключение конфигурации из файла
    end,
  },
  -- простая и быстрая полоса прокрутки для Neovim. Она намеренно лишена
  -- каких-либо особенностей и останется таковой.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/ojroques/nvim-scrollbar
  {
    "ojroques/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      require "configs.scrollbar"
    end,
  },
  -- плагин neovim для создания файлов .gitignore за считанные секунды,
  -- позволяющий вам выбирать из огромного количества различных технологий.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/wintermute-cell/gitignore.nvim
  {
    "wintermute-cell/gitignore.nvim",
    config = function()
      require "configs.gitignore"
    end,
  },
  -- nvim-ufo - плагин для управления видимостью блоков
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/kevinhwang91/nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    config = function()
      require "configs.ufo" -- Подключаем отдельный конфиг
    end,
  },
  -- очень экспериментальный плагин, который полностью заменяет пользовательский
  -- интерфейс для сообщений,
  -- командной строки и всплывающего меню.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/folke/noice.nvim?ysclid=m08hkqwulh979062613
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    config = function()
      require "configs.noice" -- Подключаем отдельный конфиг
    end,
  },
  -- добавляет цветовые обозначения для скобок и других ограничителей в коде, чтобы
  -- сделать его более читабельным.
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/HiPhish/rainbow-delimiters.nvim
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.rainbow_delimiters" -- Подключаем отдельный конфиг
    end,
  },
  -- предназначен для отображения вертикальных линий, которые помогают визуально
  -- обозначать уровни отступов в коде. Это делает код более читабельным, особенно в
  -- языках программирования с вложенной структурой (например, Python, JavaScript, Lua и др.).
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/lukas-reineke/indent-blankline.nvim
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    config = function()
      require "configs.indent_blankline"
    end,
  },
  -- плагин используется для отслеживания времени, проведенного за написанием кода в
  -- редакторе Vim или Neovim
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/wakatime/vim-wakatime
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    config = function()
      require "configs.wakatime"
    end,
  },
  -- плагин используется для управления большими файлами в Neovim.
  -- ПРИМИЧАНИЕ: подробно смотри: -- https://github.com/LunarVim/bigfile.nvim
  {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    config = function()
      require "configs.bigfile"
    end,
  },
  -- плагин предназначен для работы с инструментом Nx, который используется
  -- для разработки и управления монорепозиториями в JavaScript/TypeScript проектах.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/Equilibris/nx.nvim
  {
    "Equilibris/nx.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require "configs.nx" -- замените на путь к вашему конфигурационному файлу
    end,
  },
  --  универсальный плагин neovim, написанный на lua, который обеспечивает
  --  превосходное управление проектами.
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/ahmedkhalf/project.nvim
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- Укажите пути к вашим проектам
        manual_mode = false, -- автоматически определять проекты
        detection_methods = { "pattern", "lsp" }, -- методы обнаружения проектов
        patterns = { ".git", "Makefile", "package.json", "Cargo.toml" }, -- шаблоны для определения корня проекта
        show_hidden = false, -- показывать скрытые файлы
        silent_chdir = true, -- без вывода сообщений о смене директории
        scope_chdir = "global", -- область действия смены директории (global или local)
      }
    end,
  },
  -- плагин, который показывает доступные команды и их комбинации, что может
  -- помочь в изучении сочетаний клавиш.
  -- ПРИМИЧАНИЕ: подробнее смотри: https://github.com/folke/which-key.nvim
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- Настройки по умолчанию
        plugins = {
          marks = true, -- показывать закладки
          registers = true, -- показывать регистры
          spelling = {
            enabled = true, -- показывать исправления для опечаток
            suggestions = 20, -- количество предложений
          },
        },
        key_labels = {}, -- можете изменить метки клавиш
        icons = {
          breadcrumb = "»", -- иконка для "хлебных крошек"
          separator = "➜", -- иконка для разделителей
          group = "+", -- иконка для групп
        },
        window = {
          border = "rounded", -- стиль границы окна
          position = "bottom", -- положение окна (bottom, top, left, right)
          margin = { 1, 2, 1, 2 }, -- отступы
          padding = { 2, 2, 2, 2 }, -- внутренние отступы
        },
        layout = {
          height = { min = 4, max = 25 }, -- высота окна
          width = { min = 20, max = 50 }, -- ширина окна
          spacing = 3, -- расстояние между элементами
        },
        ignore_missing = false, -- игнорировать отсутствующие клавиши
        show_help = true, -- показывать помощь по сочетаниям клавиш
      }

      -- Пример настройки пользовательских сочетаний клавиш
      local wk = require "which-key"
      wk.register({
        ["<leader>f"] = { name = "File", f = "Find file", r = "Refresh file", s = "Save file" },
        ["<leader>g"] = { name = "Git", s = "Status", c = "Commit", p = "Push" },
        ["<leader>w"] = { name = "Window", h = "Split left", j = "Split below", k = "Close window" },
      }, { prefix = "<leader>" })
    end,
  },
  -- плагин Neovim для просмотра файловой системы и других древовидных структур
  -- в любом удобном для вас стиле, включая боковые панели, плавающие окна,
  -- разделенный стиль netrw или все сразу!
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/nvim-neo-tree/neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Зависимость
      "nvim-tree/nvim-web-devicons", -- Иконки для файлов
    },
    config = function()
      require("neo-tree").setup {
        close_if_last_window = true, -- Закрывать, если это последнее окно
        popup_border_style = "rounded", -- Стиль границы всплывающих окон
        enable_git_status = true, -- Включить статус git
        enable_diagnostics = true, -- Включить диагностику
        default_component_configs = {
          name = {
            use_git_status_colors = true, -- Использовать цвета статусов git
          },
          git_status = {
            symbols = {
              -- Внешний вид символов статусов
              added = "✚", -- Добавленные файлы
              modified = "✏️", -- Измененные файлы
              deleted = "✖️", -- Удаленные файлы
              renamed = "➜", -- Переименованные файлы
              untracked = "★", -- Неотслеживаемые файлы
              ignored = "☒", -- Игнорируемые файлы
              -- и т.д.
            },
          },
        },
        window = {
          position = "left", -- Позиция окна (left, right, top, bottom)
          width = 30, -- Ширина окна
          mappings = {
            ["<space>"] = "toggle_node", -- Переключение узлов
            ["<cr>"] = "open", -- Открытие файла или папки
            ["<bs>"] = "close_node", -- Закрытие узлов
            ["<leader>r"] = "refresh", -- Обновление дерева
            -- Добавьте свои сочетания клавиш здесь
          },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = true, -- Скрыть файлы с точкой
            hide_gitignored = true, -- Скрыть игнорируемые git файлы
          },
          follow_current_file = true, -- Следить за текущим файлом
          group_empty_dirs = true, -- Группировка пустых директорий
        },
      }

      -- Привязка клавиш для открытия/закрытия neo-tree
      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
    end,
  },
  -- умный и мощный плагин для комментирования для neovim
  -- ПРИМИЧАНИЕ: подробно смотри: https://github.com/numToStr/Comment.nvim
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        -- Опции по умолчанию
        mappings = {
          -- Используйте <leader>c для комментирования и <leader>u для раскомментирования
          basic = true, -- Включение базовых сочетаний клавиш
          extra = true, -- Включение дополнительных сочетаний клавиш
        },
        pre_hook = function(ctx)
          local U = require "Comment.utils"

          -- Определяем, что делать в зависимости от типа контекста
          if ctx.ctype == U.ctype.block then
            return "--[[", "--]]" -- Использование блочных комментариев
          else
            return "--", "" -- Использование однострочных комментариев
          end
        end,
        post_hook = nil, -- Вы можете добавить функцию для выполнения после комментирования
      }
    end,
  },
}
