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
    "habamax/vim-godot",
    ft = { "gd", "gdscript" },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    config = function()
      require "configs.lazygit"
    end,
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
    "mfussenegger/nvim-dap",
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "b0o/nvim-tree-preview.lua",
    },
    config = function()
      require "configs.nvimtree"
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
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
        "svelte-language-server",
        "stylua",
        "html-lsp",
        "gopls",
        "css-lsp",
        "prettierd",
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "delve",
        "nextls",
        "elixirls",
        "emmet-language-server",
        "gdscript",
      },
    },
  },
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require "configs.supermaven"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    ft = {
      "javascript",
      "typescript",
      "lua",
      "css",
      "html",
      "json",
      "svelte",
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
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
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
        "javascript",
        "typescript",
        "tsx",
        "terraform",
        "svelte",
        "gleam",
        "zig",
        "gdscript",
        "godot_resource",
        "gdshader",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    dependencies = {
      { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate",
  },
}
