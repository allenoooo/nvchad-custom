---@type vim.lsp.Config
return {
  cmd = {
    "c3lsp",
    "-c3c-path", "c3c",
    "-stdlib-path", "/opt/homebrew/opt/c3c/lib/c3/std",
  },
  filetypes = { "c3" },
  root_markers = { "project.json", "manifest.json", ".git" },
  single_file_support = true,
}
