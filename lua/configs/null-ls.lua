local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Custom Zig formatter definition
local zig_fmt = {
  name = "zig_fmt",
  method = null_ls.methods.FORMATTING,
  filetypes = { "zig" },
  generator = null_ls.generator {
    command = "zig",
    args = { "fmt", "--stdin" },
    to_stdin = true,
  },
}
local opts = {
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.clang_format.with {
      extra_args = { "--style=file" },
    },
    zig_fmt,
  },
  null_ls.builtins.formatting.golines.with {
    extra_args = { "--max-len=120", "--tab-width=4", "--base-formatter=gofumpt" },
  },

  -- on github workflows and helm and stuff with weird yaml syntax, formatting on save messes up the yaml/templating
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}

return opts
