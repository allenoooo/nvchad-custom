require("nvchad.configs.lspconfig").defaults()

-- Optional: use SchemaStore for better YAML schemas
local has_schemastore, schemastore = pcall(require, "schemastore")

local servers = {
  "html",
  "cssls",
  "elixirls",
  "gopls",
  "rust_analyzer",
  "clangd",
  "ts_ls",
  "tailwindcss",
  "eslint",
  "terraformls",
  "solidity_ls",
  -- YAML / Helm
  "yamlls",
  "helm_ls",
  "zls",
}
vim.lsp.enable(servers)

-- Elixir LS configuration
vim.lsp.config.elixirls = {
  cmd = {
    vim.fn.expand "~/.config/nvim/start-elixir-ls.sh",
  },
  root_markers = { "mix.exs", ".git" },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
    },
  },
}

-- YAML (yaml-language-server)
vim.lsp.config.yamlls = {
  cmd = { "yaml-language-server", "--stdio" },
  root_markers = { ".git" },
  settings = {
    yaml = {
      validate = true,
      hover = true,
      completion = true,
      format = { enable = false }, -- handled by conform/prettier
      schemaStore = { enable = false, url = "" },
      schemas = has_schemastore and schemastore.yaml.schemas() or {},
    },
  },
}

-- Helm templates (helm-ls)
do
  local helm_cmd = (vim.fn.executable("helm_ls") == 1 and "helm_ls")
    or (vim.fn.executable("helm-ls") == 1 and "helm-ls")
    or "helm_ls"
  vim.lsp.config.helm_ls = {
    cmd = { helm_cmd, "serve" },
    filetypes = { "helm" },
    root_markers = { "Chart.yaml", ".git" },
    settings = {
      ["helm-ls"] = {
        yamlls = { path = "yaml-language-server" },
      },
    },
  }
end

-- Solidity configuration
vim.lsp.config.solidity_ls = {
  cmd = { "vscode-solidity-server", "--stdio" },
  filetypes = { "solidity" },
  root_markers = { "hardhat.config.*", "truffle-config.js", "foundry.toml", ".git" },
  settings = {
    solidity = {
      compileUsingRemoteVersion = "latest",
      enabledAsYouTypeCompilationErrorCheck = true,
      validationDelay = 1500,
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
  root_markers = {
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json",
    "package.json",
    ".git",
  },
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

-- Clangd (C/C++) configuration
vim.lsp.config.clangd = {
  cmd = { "clangd" },
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    ".git",
  },
}

-- Zig LSP configuration
vim.lsp.config.zls = {
  cmd = { "zls" },
  root_markers = { "build.zig", ".git" },
  settings = {
    zls = {
      enable_autofix = false,
      enable_snippets = true,
      enable_ast_check_diagnostics = true,
      enable_build_on_save = true,
      build_on_save_step = "check",
    },
  },
}
