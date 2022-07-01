# easy.nvim

The whole purpose of this is was my annoyance for vim 'distros', and their overcomplexity.
At first I wanted this to be totally independent project, so I don't have to rely on others updates, but my vim coding knowledge is to small.

For now it is, set of lua scripts, and git projects linked together, so it is easy to use, with basic features(like autocompletion).

![Banner](https://raw.github.com/DesantBucie/DesantBucie/master/easy.nvim/banner.png)

## TODO

* Vim last session
* Numered tabs
* generally writing some things by myself, so i don't have to rely on others.

## Language server protocol

This uses neovim built-in LSP. Unfortunately that means, **you will be reponsible for installing lsp!** Check them out: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

Ts,js,html,clangd are all set. To add your server to config(after you installed it) put this `lsp.<servername>.setup{}` to _~/.config/nvim/init.lua_ 

By the way, set up node, so global packages doesn't need root privilages: `npm config set prefix '~/.local/npm-global'/`(or any other directory that doesn't).

## Instalation

Run install.sh

## Keybindings

The leader key can be different depending on system. For me it's `\`. You can customise it in _~/.config/init.lua_(`cmd [[ let mapleader = 'choose\_key']]`).

* lead + n - directory explorer 
* lead + t - new tab
* lead + s - vertical split
* tab - move between workplaces
* :Temp - load template if avaliable.

### Autocompletion

* Shift + Tab - go down in autocmpletion window
* Control + Tab - go up

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
