# THIS PROJECT IS DICOUNTINUED

I become sort of bored using this. I'm not even sure if it works for someone else(I am talking to you this one person who starred :D). Guess I'll be switching back to vim. 

If you are interested I'm (when I'm writing this) planning to make new vim9 config/addon which I call Triton
as I had no real other idea how to call it, and this word was somewhere in my mind for some reason. So, You can Check it up:
[Link](https://github.com/DesantBucie/triton).

## TODO

* Vim last session
* Numered tabs
* generally writing some things by myself, so i don't have to rely on others(I really believed that...).

## Language server protocol

This uses neovim built-in LSP. Unfortunately that means, **you will be reponsible for installing lsp!** Check them out: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

Ts,js,html,clangd are all set. To add your server to config(after you installed it) put this `lsp.<servername>.setup{}` to _~/.config/nvim/init.lua_ 

By the way, set up node, so global packages doesn't need root privilages: `npm config set prefix '~/.local/npm-global'/`(or any other directory that doesn't).

## Instalation

You have to have git installed and in PATH.

UNIX: Run install.sh, even if you have powershell, it won't work.

Windows: Run install.ps1

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
