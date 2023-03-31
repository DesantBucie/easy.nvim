#!/bin/sh
CURRENT_PWD="$PWD"
NVIM_REQU="NVIM v0.5.0"
NVIM_VERS=$(nvim --version | sed 1q)
NVIM_CONFIG="$HOME/.config/nvim"
NVIM_PLUGINS="$HOME/.local/share/nvim/site/pack/plugins/start"
NVIM_UNLOADED="$HOME/.local/share/nvim/site/pack/plugins/opt"

! type git && echo "No git installed" && exit 127
! type printf && echo "No printf installed" && exit 127
! type sed && echo "No sed installed" && exit 127
! type sort && echo "No sort installed" && exit 127

make_folder_if_doesnt_exist() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
    else 
        cd "$1" && rm -rf ./*
    fi
}

if [ ! "$(printf '%s\n' "$NVIM_REQU" "$NVIM_VERS" | sort -V | sed 1q)" = "$NVIM_REQU" ]; then
    echo "At least Neovim 0.5.0 or newer is needed"
    exit 127
fi
make_folder_if_doesnt_exist "$NVIM_CONFIG"
make_folder_if_doesnt_exist "$NVIM_PLUGINS"
make_folder_if_doesnt_exist "$NVIM_UNLOADED"

cd "$CURRENT_PWD"
cp init.lua "$NVIM_CONFIG" && echo COPYING init.lua
cd .. && cp -r "easy.nvim" "$NVIM_PLUGINS" 
cd "$NVIM_PLUGINS" || exit 127;
git clone https://github.com/neovim/nvim-lspconfig
git clone https://github.com/luochen1990/rainbow
git clone https://github.com/hrsh7th/cmp-nvim-lsp
git clone https://github.com/hrsh7th/cmp-buffer
git clone https://github.com/hrsh7th/cmp-path
git clone https://github.com/hrsh7th/cmp-cmdline
git clone https://github.com/hrsh7th/nvim-cmp
git clone https://github.com/hrsh7th/cmp-vsnip
git clone https://github.com/hrsh7th/vim-vsnip
git clone https://github.com/windwp/nvim-autopairs.git
echo "Now you need to install language servers on your behalf."
echo "Best you check yourself: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md"
