vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.backup = false
opt.swapfile = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.tabstop = 4
opt.shell = "zsh"
opt.inccommand = "split"
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.tabstop = 2
opt.wrap = false -- никаких линий переноса
opt.wildignore:append { "*/node_modules/*" }
opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

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
      require "options"
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
