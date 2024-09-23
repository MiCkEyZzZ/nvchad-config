local present, neotest = pcall(require, "neotest")

if not present then
  print "Не удалось загрузить neotest"
  return
end

neotest.setup {
  adapters = {
    require "neotest-jest" {
      jestCommand = "npm test --",
      jestConfigFile = "jest.config.ts",
      env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    },
  },
}
