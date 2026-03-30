require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.wrap = false -- disable word wrap
o.smoothscroll = true -- interpolate scroll instead of jumping whole lines
o.scrolloff = 8 -- keep 8 lines of context around cursor when scrolling

-- Add Mason bin directory to PATH for LSP servers
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"
