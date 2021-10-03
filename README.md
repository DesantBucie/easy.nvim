# easy.nvim

The whole purpose of this is was my annoyance for needing hunderets of plugins to use vim.
I want to use built-in features.

![Banner](https://raw.github.com/DesantBucie/DesantBucie/master/easy.nvim/banner.png)

## TODO

* Vim last session
* Numered tabs

## Language server protocol

This uses neovim built-in LSP. Unfortunately that means, **you will be reponsible for installing lsp!** Check them out: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

`require'lspconfig'.<servername>.setup{on_attach=require'completion'.on_attach};`

Btw, setting up node, so global packages doesn't need root privilages: `npm config set prefix '~/.local/npm-global'/`(or any other directory that doesn't).

## Instalation

Run install.sh

## Keybindings

The leader key can be different depending on system. For me it's `\`. You can customise it in `~/.config/init.lua`(`cmd [[ let mapleader = 'choose_key']]`).

* lead + n - directory explorer 
* lead + t - new tab
* lead + s - vertical split
* tab - move between workplaces

## Plugins management

* Update *easy* `:EasyUpdate`
* Install Plugin `:PluginInstall <url | multiple urls>`
* List Plugins `:PluginList`
* Update all plugins `:PluginUpdate <packages names(optional, if not defined, all will be searched)>`
* Remove plugin `:PluginDelete <name of plugin | plugins (printed by :PluginList)>`

## Colorschemes

From that point, *easy* won't include any colorschemes. It's easy to use one though.

1. Choose colorscheme, best without any dependencies, for example [gruvbox8](https://github.com/lifepillar/vim-gruvbox8)
2. `:Plugin Install <url>`
3. Add `cmd [[ <colorscheme-name> ]]` to `~/.config/nvim/init.lua`

## Advices

* Bind ESC to Caps-Lock, for example on mac:

![Esc](https://raw.github.com/DesantBucie/DesantBucie/master/easy.nvim/esc.gif)
