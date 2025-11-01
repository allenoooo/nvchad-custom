require "nvchad.autocmds"

-- C/C++ specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    -- Set indentation to 4 spaces for C/C++
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true

    -- Set C standard (C99)
    vim.opt_local.commentstring = "// %s"

    -- Enable code folding
    vim.opt_local.foldmethod = "syntax"
    vim.opt_local.foldlevel = 99
  end,
})

-- Go specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    -- Set indentation to 4 spaces for Go
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})

-- Rust specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    -- Set indentation to 4 spaces for Rust
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true

    -- Enable inlay hints
    vim.lsp.inlay_hint.enable(true)

    -- Set comment string
    vim.opt_local.commentstring = "// %s"

    -- Enable code folding
    vim.opt_local.foldmethod = "syntax"
    vim.opt_local.foldlevel = 99
  end,
})

-- Cargo.toml crates.nvim integration
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "Cargo.toml",
  callback = function()
    -- Add crates source to nvim-cmp for Cargo.toml files
    local cmp = require "cmp"
    local sources = cmp.get_config().sources
    table.insert(sources, { name = "crates" })
    cmp.setup.buffer { sources = sources }
  end,
})

-- C project setup hints
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.c", "*.h" },
  callback = function()
    local root = vim.fs.root(0, { "Makefile", ".git", "compile_commands.json" })
    if root then
      local compile_flags = root .. "/compile_flags.txt"
      local clang_format = root .. "/.clang-format"

      -- Check if .clang-format exists
      local cf = io.open(clang_format, "r")
      if cf then
        cf:close()
      end
    end
  end,
  once = true,
})

-- Template for new .h files with #pragma once
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.h",
  callback = function()
    local filename = vim.fn.expand("%:t:r"):upper()
    local lines = {
      "#pragma once",
      "",
      "// " .. filename,
      "",
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.api.nvim_win_set_cursor(0, { 4, 0 })
  end,
})
