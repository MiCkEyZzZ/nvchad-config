return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("configs.conform")
		end,
	},

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

	{
		"stevearc/dressing.nvim",
		lazy = false,
		opts = {},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{ "nvim-neotest/nvim-nio" },

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
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
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
				"dockerls",
				"yamlls",
				"jsonls",
				"marksman",
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			require("configs.lint")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Значения по умолчанию
					enable_close = true, -- Автоматическое закрытие тегов
					enable_rename = true, -- Автоматическое переименование пар тегов
					enable_close_on_slash = false, -- Автоматическое закрытие при замыкании </
				},
			})
		end,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("configs.better-escape")
		end,
	},

	{
		"phaazon/hop.nvim",
		event = "BufReadPost",
		branch = "v2",
		config = function()
			require("configs.hop")
		end,
	},

	{
		"RRethy/vim-illuminate",
		event = "BufReadPost",
		config = function()
			require("configs.illuminate")
		end,
	},

	-- плавная прокрутка при скролинге
	-- подробнее смотри: https://github.com/karb94/neoscroll.nvim
	{
		"karb94/neoscroll.nvim",
		event = "BufReadPost",
		config = function()
			require("configs.neoscroll")
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
			require("configs.visual-multi")
		end,
	},

	{
		"nvim-neotest/neotest",
		event = "VeryLazy",
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "jest.config.ts",
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
	},

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

	{
		"razak17/tailwind-fold.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "VeryLazy",
		config = function()
			require("tailwind-fold").setup({ ft = { "html", "twig" } })
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup()

			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},

	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
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
			require("configs.lualine")
		end,
	},
}
