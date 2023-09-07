# Custom NvChad config

## Requirements
neovim plugins are installed/maintained by mason/treesitter/lazy.nvim/etc from within nvim.
All dependencies outside of *Core* are lazy-loaded, meaning that if you don't plan to develop
in that language, and so don't open filetypes of that particular language, you should be fine
to skip the requirements for that language.

### Core
* [neovim](https://neovim.io/)
* [NvChad](https://github.com/NvChad/NvChad)
* [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
### Go development
* [goimports-reviser](https://github.com/incu6us/goimports-reviser)
* [gofumpt](https://github.com/mvdan/gofumpt)
* [golines](https://github.com/segmentio/golines)
* [delve](https://github.com/go-delve/delve)
* *Treesitter Go* run `:TSInstall go` from the nvim command-line

## Installation
* Clone this repo to your *custom* NvChad directory:
```bash
rm -rf ~/.config/nvim/lua/custom
git clone https://github.com/allenoooo/nvchad-custom.git ~/.config/nvim/lua/custom`
```
