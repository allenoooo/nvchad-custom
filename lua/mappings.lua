require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<cr>",  { desc = "TmuxNavigateLeft" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<cr>",  { desc = "TmuxNavigateDown" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<cr>",    { desc = "TmuxNavigateUp" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<cr>", { desc = "TmuxNavigateRight" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
