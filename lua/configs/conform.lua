local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    go = { "gofumpt", "goimports_reviser", "golines" },
    typescript = { "prettierd" },
    javascript = { "prettierd" },
    elixir = { "elixir-ls" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
