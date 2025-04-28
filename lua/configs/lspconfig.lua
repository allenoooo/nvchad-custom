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
  "gleam",
  "clangd",
  "c3_lsp",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          [vim.fn.expand "${3rd}/love2d/library"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "-j=10",
    "--header-insertion-decorators",
    "--query-driver=/usr/bin/**/clang-*",
  },
  init_options = {
    fallbackFlags = { "-std=c++17" },
  },
}

lspconfig.rust_analyzer.setup {
  on_attach = function(client, bufnr)
    -- Disable LSP formatting in favor of rustfmt
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    -- Call the shared on_attach
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

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

lspconfig.zls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "zls" },
  filetypes = { "zig" },
}

lspconfig.ols.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "odin" },
  -- root_dir = lspconfig.util.root_pattern("ols.json", ".git"),
  init_options = {
    enable_document_symbols = true,
    enable_hover = true,
    enable_snippets = true,
  },
}

-- lspconfig.tailwindcss.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   filetypes = { "html", "heex", "eelixir", "elixir", "javascriptreact", "typescriptreact" },
--
--   init_options = {
--     userLanguages = {
--       elixir = "html-eex",
--       eelixir = "html-eex",
--       heex = "html-eex",
--     },
--   },
-- }

-- lspconfig.buf_ls.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   cmd = { "buf_ls", "serve" },
--   filetypes = { "proto" },
-- }

-- lspconfig.elixirls.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   filetypes = { "elixir", "eelixir", "heex" },
--   cmd = { "elixir-ls" },
-- }

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
