local present, nx = pcall(require, "nx")

if not present then
  print "Не удалось загрузить nx.nvim"
  return
end

nx.setup {
  nx_cmd_root = "nx", -- Базовая команда для запуска всех остальных команд nx
  command_runner = require("nx.command-runners").terminal_cmd(), -- Запуск команд в терминале
  form_renderer = require("nx.form-renderers").telescope(), -- Визуализация форм через Telescope
  read_init = true, -- Загружать конфигурацию nx
}
