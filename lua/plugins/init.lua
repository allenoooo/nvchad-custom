return {
  -- {
  --   "stevearc/conform.nvim",
  --   event = "BufWritePre",
  --   config = function()
  --     require "configs.conform"
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    config = function()
      require "configs.lazygit"
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
      },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      -- check the installation instructions at
      -- https://github.com/folke/snacks.nvim
      "folke/snacks.nvim",
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        server = {
          on_attach = function(client, bufnr)
            -- Call the shared on_attach function first
            require("nvchad.configs.lspconfig").on_attach(client, bufnr)
            -- Enable format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              pattern = "*.rs",
              callback = function()
                vim.lsp.buf.format { timeout_ms = 2000 }
              end,
            })
          end,
          settings = {
            -- rust-analyzer settings
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
              -- Enable rustfmt
              rustfmt = {
                rangeFormatting = {
                  enable = true,
                },
              },
            },
          },
        },
        -- rustfmt configuration
        rustfmt = {
          rangeFormatting = {
            enable = true,
          },
        },
      }
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require "configs.gitsigns"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "gopls",
        "css-lsp",
        "prettierd",
        "eslint-lsp",
        "delve",
        "gdscript",
        "clangd",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    ft = {
      "lua",
      "css",
      "html",
      "json",
      "yaml",
      "go",
      "terraform",
      "gleam",
    },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "proto",
        "lua",
        "vimdoc",
        "html",
        "css",
        "terraform",
        "gleam",
        "zig",
        "gdshader",
        "odin",
        "c3",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")

      -- Register C3 parser configuration
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.c3 = {
        install_info = {
          url = "https://github.com/c3lang/tree-sitter-c3",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "main",
        },
      }

      -- Register C3 file extensions
      vim.filetype.add {
        extension = {
          c3 = "c3",
          c3i = "c3",
          c3t = "c3",
        },
      }

      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
      { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate",
  },
}
