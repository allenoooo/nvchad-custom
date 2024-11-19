local supermaven = require("supermaven-nvim")

supermaven.setup({
  keymaps = {
    accept_suggestion = "<c-y>",
    clear_suggestion = "<c-]>",
    accept_word = "<c-u>",
  },
  color = {

    suggestion_color = "#ff2c2c",
    cterm = 244,
  },
  log_level = "off", -- set to "off" to disable logging completely
  disable_inline_completion = false, -- disables inline completion for use with cmp
  disable_keymaps = false -- disables built in keymaps for more manual control
})
