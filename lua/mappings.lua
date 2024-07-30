require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<cr>", { desc = "TmuxNavigateLeft" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<cr>", { desc = "TmuxNavigateDown" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<cr>", { desc = "TmuxNavigateUp" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<cr>", { desc = "TmuxNavigateRight" })

map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

map("n", "<leader>gl", "<cmd>Gitsigns blame_line<cr>", { desc = "blame single line" })
map("n", "<leader>gb", "<cmd>Gitsigns blame<cr>", { desc = "blame all" })

map("n", "<leader>s", "<cmd>split<cr>", { desc = "split" })
map("n", "<leader>ss", "<cmd>vsplit<cr>", { desc = "vsplit" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- dap
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "toggle breakpoint" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "toggle ui" })

-- dap-go
map("n", "<leader>dgt", "<cmd>lua require('dap-go').debug_test()<cr>", { desc = "debug go test" })
map("n", "<leader>dgl", "<cmd>lua require('dap-go').debug_last()<cr>", { desc = "debug last go test" })

-- gopher
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "gopher add json tag" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "gopher add yaml tag" })
