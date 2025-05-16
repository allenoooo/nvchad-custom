require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<cr>", { desc = "TmuxNavigateLeft" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<cr>", { desc = "TmuxNavigateDown" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<cr>", { desc = "TmuxNavigateUp" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<cr>", { desc = "TmuxNavigateRight" })

map("n", "gd", "<cmd> Telescope lsp_definitions<cr>")
map("n", "gr", function()
  require("telescope.builtin").lsp_references({
    initial_mode = "normal",
    theme = "dropdown",
    previewer = false,  -- This is the key part
  })
end, { desc = "LSP References" })

map("n", "gI", vim.lsp.buf.implementation, { desc = "Go to Implementation" })

map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "lsp config code action" })

map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

map("n", "<leader>gl", "<cmd>Gitsigns blame_line<cr>", { desc = "blame single line" })
map("n", "<leader>gb", "<cmd>Gitsigns blame<cr>", { desc = "blame all" })

map("n", "<leader>s", "<cmd>split<cr>", { desc = "split" })
map("n", "<leader>ss", "<cmd>vsplit<cr>", { desc = "vsplit" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- dap
map('n', '<leader>dc', function() require'dap'.continue() end)
map('n', '<leader>do', function() require'dap'.step_over() end)
map('n', '<leader>di', function() require'dap'.step_into() end)
map('n', '<leader>dt', function() require'dap'.step_out() end)
map('n', '<Leader>db', function() require'dap'.toggle_breakpoint() end)
map('n', '<Leader>dus', function()
  local widgets = require('dap.ui.widgets')
  widgets.sidebar(widgets.scopes).open()
end)

-- dap-go
map("n", "<leader>dgt", "<cmd>lua require('dap-go').debug_test()<cr>", { desc = "debug go test" })
map("n", "<leader>dgl", "<cmd>lua require('dap-go').debug_last()<cr>", { desc = "debug last go test" })

-- gopher
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "gopher add json tag" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "gopher add yaml tag" })
map("n", "<leader>gie", "<cmd> GoIfErr <CR>", { desc = "gopher iferr" })

-- yazi
map("n", "<C-n>", "<cmd>Yazi cwd<cr>", { desc = "yazi cwd" })
map("n", "<C-m>", "<cmd>Yazi<cr>", { desc = "yazi current file" })
