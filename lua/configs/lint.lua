local present, lint = pcall(require, "lint")

if not present then
  print "Не удалось загрузить nvim-lint"
  return
end

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  json = { "jsonlint" },
  yaml = { "yamllint" },
  prisma = { "prisma" },
  thrift = { "thrift" },
  css = { "stylelint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
