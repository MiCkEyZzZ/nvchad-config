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
    config = function()
      require("mason").setup {
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
        },
      }
    end,
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
  -- Hop - это плагин, похожий на EasyMotion, который позволяет вам переходить в любое
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

  {
    "rbong/vim-flog",
    dependencies = {
      "tpope/vim-fugitive",
    },
    lazy = false,
  },

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
      require "configs.trouble"
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
            alt = {
              "FIXME",
              "BUG",
              "FIXIT",
              "ISSUE",
              "ИСПРАВИТЬ",
              "ПРОБЛЕМА",
            },
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
            alt = {
              "ПРЕДУПРЕЖДЕНИЕ",
              "ВНИМАНИЕ",
              "ОСТОРОЖНО",
            },
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
            alt = {
              "TESTING",
              "ТЕСТИРОВАНИЕ",
              "PASSED",
              "ПРОЙДЕН",
              "FAILED",
            },
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
          multiline_context = 5, -- уменьшить количество линий для пересчёта
          before = "",
          keyword = "wide", -- выделение ключевого слова и фона
          after = "fg", -- выделение текста после ключевого слова
          pattern = [[.*<(KEYWORDS)\s*:]],
          comments_only = true, -- использовать только для комментариев
          max_line_len = 200, -- игнорировать слишком длинные строки
          exclude = { "markdown" }, -- исключить определенные типы файлов
        },
        -- список именованных цветов, в котором мы пытаемся извлечь графический интерфейс из
        -- список выделенных групп или используйте шестнадцатеричный цвет, если hl не найден, в качестве запасного варианта
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" }, -- здесь теперь статический цвет
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
            "--smart-case", -- игнорирование регистра
            "--hidden", -- поиск в скрытых файлах
            "--glob=!**/node_modules/**", -- исключение node_modules
            "--glob=!**/*.min.*", -- исключение минифицированных файлов
            "--glob=!**/dist/**", -- исключение dist
          },
          pattern = [[\b(KEYWORDS):]],
        },
      }
    end,
  },

  -- нативный плагин Codeium для Neovim.
  -- подробнее смотри: https://github.com/Exafunction/codeium.nvim
  {
    "Exafunction/codeium.vim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
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
      vim.fn["mkdp#util#install"]() -- Установка необходимых зависимостей для плагина
    end,
    init = function()
      vim.g.mkdp_theme = "dark" -- Установка темы предпросмотра на тёмную
      vim.g.mkdp_auto_start = 0 -- Отключить автозапуск предпросмотра
      vim.g.mkdp_auto_close = 1 -- Автоматическое закрытие при переключении буфера
      vim.g.mkdp_refresh_slow = 1 -- Более медленное обновление для производительности
      vim.g.mkdp_page_title = "${name} — Markdown Preview" -- Кастомизация заголовка страницы
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
  -- плагин neovim для создания файлов .gitignore за считанные секунды,
  -- позволяющий вам выбирать из огромного количества различных технологий.
  -- подробнее смотри: https://github.com/wintermute-cell/gitignore.nvim
  {
    "wintermute-cell/gitignore.nvim",
    config = function()
      require "gitignore"
    end,
  },
  -- nvim-ufo - плагин для управления видимостью блоков
  -- подробнее смотри: https://github.com/kevinhwang91/nvim-ufo
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
    opts = {
      -- ПРИМИЧАНИЕ: раскомментируйте, чтобы использовать three hitter в качестве поставщика fold, в
      -- противном случае используется nvim lsp
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      open_fold_hl_timeout = 400,
      close_fold_kinds_for_ft = {
        -- "imports",
        -- "comment",
      },
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          -- winhighlight = "Normal:Folded",
          winblend = 0,
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          jumpTop = "[",
          jumpBot = "]",
        },
      },
    },
    init = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "1" -- '0' это не так уж плохо
      vim.o.foldlevel = 900 -- При использовании ufo provider требуется большое значение, не стесняйтесь уменьшать значение
      vim.o.foldlevelstart = 99
      vim.o.foldenable = false
    end,
    config = function(_, opts)
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local totalLines = vim.api.nvim_buf_line_count(0)
        local foldedLines = endLnum - lnum
        local suffix = (" 󰁂 %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end

        local nvimWidth = vim.api.nvim_win_get_width(0)

        local rAlignAppndx = math.max(math.min(nvimWidth, width - 2) - curWidth - sufWidth, 0)
        suffix = " " .. ("━"):rep(rAlignAppndx) .. suffix
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end
      opts["fold_virt_text_handler"] = handler
      require("ufo").setup(opts)
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
      vim.keymap.set("n", "zK", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          -- vim.lsp.buf.hover()
          vim.cmd [[ Lspsaga hover_doc ]]
        end
      end)
    end,
  },
  -- очень экспериментальный плагин, который полностью заменяет пользовательский интерфейс для сообщений,
  -- командной строки и всплывающего меню.
  -- подробнее смотри: https://github.com/folke/noice.nvim?ysclid=m08hkqwulh979062613
  {
    "folke/noice.nvim",
    dependencies = {
      -- если вы не хотите загружать какой-либо плагин, приведенный ниже, не забудьте добавить соответствующие
      -- записи "module="...""
      "MunifTanjim/nui.nvim",
      -- ОПЦИОНАЛЬНО:
      --   `nvim-notify` это необходимо только в том случае, если вы хотите использовать режим просмотра уведомлений.
      --   если он недоступен, мы используем "mini" в качестве запасного варианта
      "rcarriga/nvim-notify",
    },
    opts = {
      -- add any options here
      -- lsp = {
      --   signature = {
      --     enable = false,
      --   },
      -- },
    },
    event = "VeryLazy",
    config = function()
      require("noice").setup {
        lsp = {
          -- переопределите рендеринг markdown, чтобы ** cmp** и другие плагины использовали **Tree sitter.**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- требуется hrsh7th/nvim-cmp
          },
          hover = { enabled = false }, -- <-- HERE!
          signature = { enabled = false }, -- <-- HERE!
        },
        -- вы можете включить предустановку для упрощения настройки
        presets = {
          bottom_search = true, -- используйте классическую нижнюю строку команды для поиска
          command_palette = true, -- расположите командную строку и всплывающее меню вместе
          long_message_to_split = true, -- длинные сообщения будут отправлены в разделенный
          inc_rename = false, -- включает диалоговое окно ввода для inc-rename.nvim
          lsp_doc_border = false, -- добавьте рамку для наведения курсора мыши на документы и справку о подписи
        },
      }
      require("noice.lsp").hover()
      -- See: https://github.com/NvChad/NvChad/issues/1656
      -- vim.notify = require("noice").notify
      -- vim.lsp.handlers["textDocument/hover"] = require("noice").hover
      -- vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature
    end,
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
    },
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          commonlisp = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          latex = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
        blacklist = {},
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {},
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      local hooks = require "ibl.hooks"
      -- создайте группы выделения в окне настройки выделения, чтобы они были сброшены
      -- каждый раз, когда цветовая схема меняется
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup {
        scope = { highlight = highlight },
        exclude = {
          filetypes = {
            "dashboard",
          },
        },
      }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      -- require("ibl").setup()
    end,
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  {
    -- https://github.com/LunarVim/bigfile.nvim
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {
      filesize = 2, -- размер файла в MiB, плагин округляет размеры файлов до ближайшего MiB
    },
    config = function(_, opts)
      require("bigfile").setup(opts)
    end,
  },
  -- nx.nvim — расширение NX для nvim
  -- подробнее смотри: https://github.com/Equilibris/nx.nvim
  {
    "Equilibris/nx.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("nx").setup {
        -- Базовая команда для запуска всех остальных команд nx, некоторые другие значения могут быть:
        -- - `npm nx`
        -- - `yarn nx`
        -- - `pnpm nx`
        nx_cmd_root = "nx",

        -- Возможности запуска команд,
        -- более подробную информацию смотрите в разделе nx.m.command-runners
        command_runner = require("nx.command-runners").terminal_cmd(),

        -- Возможности визуализации форм,
        -- более подробную информацию смотрите в разделе Средства визуализации форм nx.m.
        form_renderer = require("nx.form-renderers").telescope(),

        -- Загружать или не загружать конфигурацию nx,
        -- более подробную информацию смотрите в разделе nx.loading-and-reloading
        read_init = true,
      }
    end,
  },
}
