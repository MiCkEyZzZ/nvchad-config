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
  },

  -- пдагин предназначен для выделения и поиска комментариев к задачам,
  -- таких как TODO, ВЗЛОМ, ОШИБКА в вашей кодовой базе
  -- подробнее смотри: https://github.com/folke/todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("todo-comments").setup()
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
    opts = function()
      return {
        transparent = true,
      }
    end,
  },

  -- плагин показывает подсказки в виде всплывающих подсказок
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
  -- Подробности: https://github.com/hrsh7th/nvim-cmp
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
}
