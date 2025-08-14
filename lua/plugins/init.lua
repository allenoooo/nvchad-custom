return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Mason for LSP management
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "elixir-ls",
        "gopls",
        "rust-analyzer",
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettier",
        "terraform-ls",
        "tflint",
        "vscode-solidity-server",
        "solhint",
        -- YAML / Helm
        "yaml-language-server",
        "helm-ls",
      },
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "elixir",
        "go",
        "rust",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "markdown",
        "markdown_inline",
        "terraform",
        "hcl",
        "solidity",
        "yaml",
      },
    },
  },

  -- Helm filetype and syntax support
  -- Not lazy to ensure ftdetect runs and sets 'helm' filetype for templates
  {
    "towolf/vim-helm",
    lazy = false,
  },

  -- SchemaStore for YAML/JSON schemas (used by yamlls)
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
  },

  -- Yazi file manager
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<C-n>",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },

  -- Lazygit integration
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
