local cmd = vim.api.nvim_command;  
local fn = vim.fn;    
local g = vim.g;      
local opt = vim.opt;  
-----------Functions---------
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
function ToggleVExplorer()
    cmd [[ Lexplore ]];
    cmd [[ vertical resize 40 ]];
end
-----------Options--------------
opt.shiftwidth = 4;
opt.scrolloff = 1;
opt.laststatus = 2;
opt.tabstop = 4;
opt.sidescrolloff = 5;
opt.background='dark'
opt.number = true;
opt.title = true;
opt.expandtab = true;
opt.errorbells = false;
opt.autoindent = true;
opt.smarttab = true;
opt.smartcase = true;
opt.ruler = true;
opt.wrap = true;
opt.showmatch = true;
opt.ignorecase = true;
opt.linebreak = true;
opt.cursorline = true;
opt.swapfile = false;
opt.showcmd = true;
opt.autoread = true;
opt.autochdir = true;
opt.backup = false;
opt.wb = false;
opt.incsearch = true;
opt.shiftround = true;
opt.compatible = false;
opt.termguicolors = true;
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.backspace = {'indent', 'eol', 'start'};
opt.clipboard = {'unnamed'};

g.netrw_keepdir = 1;
g.netrw_banner = 1;
g.netew_liststyle = 3;

map('n', '<tab>', '<C-W>w', {noremap=true});
map('', '<leader>t', 'tabe<CR>');
map('', '<leader>s', 'vsplit<CR>');
map('', '<leader>n', 'lua ToggleVExplorer()');
cmd [[ map <silent> <leader>n :lua ToggleVExplorer()<CR> ]];
cmd [[ colorscheme gruvbox ]]
cmd [[ hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red ]]
cmd [[ set path+=** ]]
require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach};
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach};
require'lspconfig'.jsonls.setup {on_attach=require'completion'.on_attach};
require'lspconfig'.html.setup{on_attach=require'completion'.on_attach};
require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach};
