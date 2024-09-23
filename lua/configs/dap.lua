local present, dap = pcall(require, "dap")

if not present then
  print "Не удалось загрузить nvim-dap"
  return
end

-- Настройка конфигураций для TypeScript
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

-- Настройка адаптера для Node.js
dap.adapters.node2 = {
  type = "executable",
  command = "node-debug2-adapter",
  args = {},
}
