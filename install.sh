#!/bin/sh
NVIM_REQU="NVIM v0.5.0"
NVIM_VERS=$(nvim --version | sed 1q)
NVIM_CONFIG="$HOME/.config/nvim"
NVIM_LOCAL="$HOME/.local/share/nvim/site/pack/plugins/start"

! type git && echo "No git installed" && exit 127
! type printf && echo "No printf installed" && exit 127
! type sed && echo "No sed installed" && exit 127
! type sort && echo "No sort installed" && exit 127

if [ ! "$(printf '%s\n' "$NVIM_REQU" "$NVIM_VERS" | sort -V | sed 1q)" -eq "$NVIM_REQU" ]; then
    echo "At least Neovim 0.5.0 or newer is needed"
    exit 127
fi
make_folder_if_doesnt_exist() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
    else 
        cd "$1" && rm -rf ./*
    fi
}
make_folder_if_doesnt_exist "$NVIM_CONFIG"
make_folder_if_doesnt_exist "$NVIM_LOCAL"

cp -r nvim_config/* "$NVIM_CONFIG"
cd "$NVIM_LOCAL" || exit 127;
git clone https://github.com/neovim/nvim-lspconfig
git clone https://github.com/nvim-lua/completion-nvim
git clone https://github.com/luochen1990/rainbow
echo "Now you need to install language servers on your behalf."
echo "Best you check yourself: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md"
