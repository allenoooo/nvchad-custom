# Custom NvChad config

## Requirements
neovim plugins are installed/maintained by mason/treesitter/lazy.nvim/etc from within nvim.
All dependencies outside of _Core_ are lazy-loaded, meaning that if you don't plan to develop
in that language, and so don't open filetypes of that particular language, you should be fine
to skip the requirements for that language. Here I only listed the dependencies that you'll
need to manually install on your system, and haven't exhaustively listed all dependencies
managed by NvChad/Mason.

### Core
* [neovim](https://neovim.io/)
* [NvChad](https://github.com/NvChad/NvChad)
* [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
### Go development
* [goimports-reviser](https://github.com/incu6us/goimports-reviser)
* [gofumpt](https://github.com/mvdan/gofumpt)
* [golines](https://github.com/segmentio/golines)
* [delve](https://github.com/go-delve/delve)
* _Treesitter Go_ run `:TSInstall go` from the nvim command-line
### Rust development
* _lldb_ for arch (btw): `pacman -S lldb`
### Python development
* No dependencies. All deps are managed by mason/lazy, so there's nothing for you to do.
### ChatGPT.nvim
We're using ChatGPT for code completion, analysis, explaining, and analysis/summarization. This
requires an OpenAI API key.
* `OPENAI_API_KEY` environment variable, with the plain text OpenAI key as the value

## Installation
* Clone this repo to your *custom* NvChad directory:
```bash
rm -rf ~/.config/nvim/lua/custom
git clone https://github.com/allenoooo/nvchad-custom.git ~/.config/nvim/lua/custom`
```
