require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "elixirls", "gopls", "rust_analyzer", "ts_ls", "tailwindcss", "eslint", "terraformls" }
vim.lsp.enable(servers)

-- Elixir LS configuration
vim.lsp.config.elixirls = {
  cmd = { 
    vim.fn.expand("~/.config/nvim/start-elixir-ls.sh")
  },
  root_markers = { "mix.exs", ".git" },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
    },
  },
}

-- Gopls configuration
vim.lsp.config.gopls = {
  cmd = { "gopls" },
  root_markers = { "go.mod", ".git" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- Rust analyzer configuration
vim.lsp.config.rust_analyzer = {
  cmd = { "rust-analyzer" },
  root_markers = { "Cargo.toml", ".git" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        features = "all",
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}

-- TypeScript/JavaScript configuration
vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  single_file_support = true,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}

-- Tailwind CSS configuration
vim.lsp.config.tailwindcss = {
  cmd = { "tailwindcss-language-server", "--stdio" },
  root_markers = { "tailwind.config.js", "tailwind.config.ts", "postcss.config.js", ".git" },
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

-- ESLint configuration
vim.lsp.config.eslint = {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  root_markers = { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json", "package.json", ".git" },
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = {
        enable = true,
      },
    },
    codeActionOnSave = {
      enable = false,
      mode = "all",
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    packageManager = "npm",
    quiet = false,
    rulesCustomizations = {},
    run = "onType",
    useESLintClass = false,
    validate = "on",
    workingDirectory = {
      mode = "location",
    },
  },
}

-- Terraform LS configuration
vim.lsp.config.terraformls = {
  cmd = { "terraform-ls", "serve" },
  root_markers = { ".terraform", ".git" },
  filetypes = { "terraform", "tf", "terraform-vars", "hcl" },
} 
