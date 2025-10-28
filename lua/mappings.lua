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
