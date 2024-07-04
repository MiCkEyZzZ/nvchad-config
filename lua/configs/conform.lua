local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    markdown = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    prisma = { "prettier" },
    go = { "goimports" },
    gomod = { "goimports" },
    gosum = { "goimports" },
    gowork = { "goimports" },
    thrift = { "thrift" },
    proto = { "buf" },
  },

  format_on_save = {
    -- Эти параметры будут переданы в conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
