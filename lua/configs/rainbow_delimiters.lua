local present, rainbow_delimiters = pcall(require, "rainbow-delimiters")

if not present then
  print "Не удалось загрузить rainbow-delimiters.nvim"
  return
end

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
