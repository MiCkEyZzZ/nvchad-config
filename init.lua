-- Подключение настроек
require "settings.general"
require "settings.ui"
require "settings.performance"

-- bootstrap lazy и все плагины
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- загрузка плагинов
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    opts = { colorscheme = "solarized_osaka" },
    config = function()
      require "options" -- Подключение общих опций, если нужно
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- загрузка темы
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
