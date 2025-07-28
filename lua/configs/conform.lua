local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    elixir = { "mix" },
    go = { "gofmt", "goimports" },
    rust = { "rustfmt" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier", "eslint" },
    typescript = { "prettier", "eslint" },
    javascriptreact = { "prettier", "eslint" },
    typescriptreact = { "prettier", "eslint" },
    tsx = { "prettier", "eslint" },
    jsx = { "prettier", "eslint" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
