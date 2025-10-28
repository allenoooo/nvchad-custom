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
        "clangd",
        "clang-format",
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
        "zls",
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
        "c",
        "cpp",
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
        "zig",
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

  -- Disable nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Yazi file manager
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<C-n>",
        "<cmd>Yazi<cr>",
        desc = "Open yazi file manager",
      },
      {
        "<leader>y",
        "<cmd>Yazi<cr>",
        desc = "Open yazi file manager",
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
}
