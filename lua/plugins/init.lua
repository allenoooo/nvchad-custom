return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
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
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "lua",
      "json",
      "svelte",
    },
    opts = function()
      return require "configs.null-ls"
    end
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
      },
    },
  },
}
