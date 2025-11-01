require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Telescope mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

-- Diagnostic navigation
map("n", "dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

-- Lazygit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- Gitsigns
map("n", "<leader>gb", function()
  require("gitsigns").blame_line()
end, { desc = "Git blame line" })

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal split" })

-- Override NvChad's nvim-tree mapping
map("n", "<C-n>", "<cmd>Yazi<cr>", { desc = "Open yazi file manager" })

-- LSP mappings
map("n", "gu", vim.lsp.buf.references, { desc = "Go to uses/references" })

-- C/C++ specific mappings
map("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch between source/header" })
map("n", "<leader>ct", "<cmd>ClangdTypeHierarchy<cr>", { desc = "Show type hierarchy" })
map("n", "<leader>cs", "<cmd>ClangdSymbolInfo<cr>", { desc = "Show symbol info" })

-- Rust crates.nvim mappings
map("n", "<leader>ct", function()
  require("crates").toggle()
end, { desc = "Toggle crates" })
map("n", "<leader>cr", function()
  require("crates").reload()
end, { desc = "Reload crates" })
map("n", "<leader>cu", function()
  require("crates").update_crate()
end, { desc = "Update crate" })
map("v", "<leader>cu", function()
  require("crates").update_crates()
end, { desc = "Update crates" })
map("n", "<leader>ca", function()
  require("crates").update_all_crates()
end, { desc = "Update all crates" })
map("n", "<leader>cU", function()
  require("crates").upgrade_crate()
end, { desc = "Upgrade crate" })
map("v", "<leader>cU", function()
  require("crates").upgrade_crates()
end, { desc = "Upgrade crates" })
map("n", "<leader>cA", function()
  require("crates").upgrade_all_crates()
end, { desc = "Upgrade all crates" })
map("n", "<leader>cH", function()
  require("crates").open_homepage()
end, { desc = "Open crate homepage" })
map("n", "<leader>cR", function()
  require("crates").open_repository()
end, { desc = "Open crate repository" })
map("n", "<leader>cD", function()
  require("crates").open_documentation()
end, { desc = "Open crate documentation" })
map("n", "<leader>cC", function()
  require("crates").open_crates_io()
end, { desc = "Open crates.io" })

-- DAP (debugging) mappings
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Set conditional breakpoint" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Continue/Start debugging" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step into" })
map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Step over" })
map("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "Step out" })
map("n", "<leader>dr", function()
  require("dap").repl.open()
end, { desc = "Open REPL" })
map("n", "<leader>dl", function()
  require("dap").run_last()
end, { desc = "Run last" })
map("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "Terminate debugging" })
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
