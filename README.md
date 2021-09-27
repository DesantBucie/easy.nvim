# easy-nvim

The whole purpose of this is was my annoyance for plugins, but we need three.
No package managers, only simple scripts to install, update etc.

## TODO

* Netrw tweaks, so it isn't buggy with split view + netrw open.
* Vim last session
* better tabs handling

## Plan

My plan is to use built-in nvim lsp. Unfortunately that means, *you will be reponsible for installing lsp.*
That means you need to setup npm global in directory that will not need root privilidges(1), few others will be installable natively, or by python manager,
or by luarocks. This means total mess. The good news is, COMPLETION SHOULD WORK WITHOUT LSP, probably much worse, but still.

(1)For example `npm config set prefix '~/.local/npm-global'`.

## Instalation

Run install.sh

## Keybindings

The leader key can be different depending on system. For me it's `\`. You can customise it in init.lua(`cmd [[ let mapleader = 'choose_key']]`).

* lead + n - directory explorer 
* lead + t - new tab
* lead + s - vertical split
* tab - move between workplaces

## Plugins management

* Install Plugin `:PluginInstall <url>`
* List Plugins `:PluginList`
* Update all plugins `:PluginUpdate`
* Remove plugin `:PluginDelete <name of folder printed by PluginList>`
