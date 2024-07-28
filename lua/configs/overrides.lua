local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "bash",
    "prisma",
    "go",
    "gomod",
    "tailwindcss",
    "gosum",
    "gowork",
    "thrift",
    "proto",
    "json",
    "yaml",
    "proto",
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]]"] = "@function.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
      },
    },
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "eslint_d",
    "clangd",
    "tailwindcss",
    "clang-format",
    "node-debug2-adapter",
    "gopls",
    "goimports",
    "gradle_ls",
    "shfmt",
    "shellcheck",
    "protols",
    "pyright",
    "solargraph",
    "sqls",
  },
}

-- поддержка git в nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
    special_files = { "README.md", "Makefile", "MAKEFILE", "Cargo.toml", "build.gradle" }, -- Список специальных файлов, которые всегда находятся наверху
  },
  view = {
    adaptive_size = true, -- изменяет размер окна в зависимости от количества файлов
  },
}

return M
