local present_dapui, dapui = pcall(require, "dapui")
local present_dap, dap = pcall(require, "dap")

if not (present_dapui and present_dap) then
  return
end

dapui.setup()

-- Открытие интерфейса DAP при запуске сессии отладки
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open {}
end

-- Закрытие интерфейса DAP при завершении сессии отладки
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close {}
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close {}
end
