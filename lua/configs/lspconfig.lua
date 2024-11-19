local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "ts_ls",
  "eslint",
  "terraformls",
  "svelte",
  "gleam",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        nilness = true,
        shadow = true,
        unusedwrite = true,
      },
    },
  },
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "html", "heex", "eelixir", "elixir", "javascriptreact", "typescriptreact" },

  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
}

lspconfig.bufls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "bufls", "serve" },
  filetypes = { "proto" },
}

lspconfig.elixirls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "elixir", "eelixir", "heex" },
  cmd = { "elixir-ls" },
}

lspconfig.emmet_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "heex" },
  init_options = {
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
  },
}
