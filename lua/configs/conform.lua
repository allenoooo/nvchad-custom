local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    elixir = { "mix" },
    go = { "gofmt", "goimports" },
    rust = { "rustfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    tsx = { "prettier" },
    jsx = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
    solidity = { "prettier" },
    zig = { "zigfmt" },
  },

  -- Enable format on save for almost all files.
  -- Helm templates are excluded by default to avoid breaking Go templating.
  format_on_save = function(bufnr)
    local ft = vim.bo[bufnr].filetype
    if ft == "helm" then
      return
    end
    return {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    }
  end,
}

return options
