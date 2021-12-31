# easy.nvim

The whole purpose of this is was my annoyance for needing hundreds of plugins to use vim.
I want to use mostly built-in features.

![Banner](https://raw.github.com/DesantBucie/DesantBucie/master/easy.nvim/banner.png)

## TODO

* Vim last session
* Numered tabs

## Language server protocol

This uses neovim built-in LSP. Unfortunately that means, **you will be reponsible for installing lsp!** Check them out: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

Ts,js,html,clangd are all set. To add your server to config(after you installed it) put this `lsp.<servername>.setup{}` to _~/.config/nvim/init.lua_ 

By the way, set up node, so global packages doesn't need root privilages: `npm config set prefix '~/.local/npm-global'/`(or any other directory that doesn't).

## Instalation

Run install.sh

## Keybindings

The leader key can be different depending on system. For me it's `\`. You can customise it in _~/.config/init.lua_(`cmd [[ let mapleader = 'choose_key']]`).

* lead + n - directory explorer 
* lead + t - new tab
* lead + s - vertical split
* tab - move between workplaces

## Plugins management

* Install Plugin `:PluginInstall <url | multiple_urls>`
* List Plugins `:PluginList`
* Update all plugins `:PluginUpdate`
* Remove plugin `:PluginDelete <plugin_name | plugin_names (printed by :PluginList)>`

## Colorschemes

From that point, *easy* won't include any colorschemes. It's easy to use one though.

1. Choose colorscheme, best without any dependencies, for example [gruvbox8](https://github.com/lifepillar/vim-gruvbox8)
2. `:Plugin Install <url>`
3. Add `cmd [[ colorscheme <colorscheme-name> ]]` to `~/.config/nvim/init.lua`

## Advices

* Bind ESC to Caps-Lock, for example on mac:

![Esc](https://raw.github.com/DesantBucie/DesantBucie/master/easy.nvim/esc.gif)
