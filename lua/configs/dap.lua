local present, dap = pcall(require, "dap")

if not present then
  print "Не удалось загрузить nvim-dap"
  return
end

-- Настройка конфигураций для TypeScript
dap.configurations.typescript = {
  {
    type = "pwa-node", -- Обновленный тип для использования js-debug
    name = "Node.js attach",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
}

-- Настройка адаптера для Node.js (js-debug)
dap.adapters["pwa-node"] = {
  type = "executable",
  command = "node",
  args = { "/home/mickeyzzz/vscode-js-debug/src/vsDebugServer.ts" },
}
