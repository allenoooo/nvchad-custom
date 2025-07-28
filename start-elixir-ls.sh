#!/bin/bash
# Direct elixir-ls starter that bypasses the problematic shell detection

# Use system Elixir
export PATH="/opt/homebrew/bin:$PATH"
export ELS_MODE=language_server

# Change to elixir-ls directory
cd /Users/drifter/.local/share/nvim/mason/packages/elixir-ls

# Run the language server using launch.exs
exec elixir --erl "-kernel standard_io_encoding latin1 +sbwt none +sbwtdcpu none +sbwtdio none" launch.exs