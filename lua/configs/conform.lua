local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    go = { "gofumpt", "goimports_reviser", "golines" },
    typescript = { "prettierd" },
    javascript = { "prettierd" },
    elixir = { "elixir-ls" },
    yaml = { "prettierd"}
  },
}

require("conform").setup(options)
