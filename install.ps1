$CURRENT_PWD=$PWD.path
$NVIM_CONFIG=$HOME + "/AppData/Local/nvim/nvim"
$NVIM_PLUGINS=$HOME + "/AppData/Local/nvim-data/site/pack/plugins/start"
$NVIM_UNLOADED=$HOME + "/AppData/Local/nvim-data/site/pack/plugins/opt"
echo $CURRENT_PWD
echo $NVIM_CONFIG
echo $NVIM_PLUGINS
echo $NVIM_UNLOADED

function make_folder_if_doesnt_exist() {
    if (Test-Path -Path $args[0]) {
        mkdir -p $args[0]
    }
    else { 
	rm -Recurse $args[0] + \*
    }
}
make_folder_if_doesnt_exist $NVIM_CONFIG
make_folder_if_doesnt_exist $NVIM_PLUGINS
make_folder_if_doesnt_exist $NVIM_UNLOADED

cp init.lua $NVIM_CONFIG 
echo COPYING init.lua
cp -r easy.nvim $NVIM_PLUGINS
if(Test-Path -Path $NVIM_PLUGINS){
    cd $NVIM_PLUGINS
}
else {
    exit 127
}
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
#>
