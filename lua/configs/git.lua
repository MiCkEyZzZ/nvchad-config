local status, git = pcall(require, "git")

if not status then
  return
end

git.setup {
  keymaps = {
    -- открыть blame окно
    blame = "gb",
    -- открыть файл/папку в репозитории git
    browse = "go",
  },
}
