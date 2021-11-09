local cmd = vim.api.nvim_command;  
local fn = vim.fn;    
local g = vim.g;      
local opt = vim.opt;  
local cmp = require'cmp'
local lsp = require'lspconfig'
-----------Functions---------
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
function ToggleVExplorer()
    g.netrw_chgwin = fn.winnr() + 1
    g.netrw_winsize = 40;
    cmd [[ Lexplore ]];
end
----------Globals----------------
g.netrw_keepdir = 1;
g.netrw_banner = 0;
g.netrw_liststyle = 3;
g.netrw_localcopydircmd = 'cp -r';
g.rainbow_active = 1;
-------------Plugin Managing----------
require'plugin_manager'
cmd [[ command -nargs=1 PluginInstall lua PluginInstall(<f-args>)]]
cmd [[ command PluginUpdate lua PluginUpdate() ]]
cmd [[ command PluginList lua PluginList() ]]
cmd [[ command -nargs=1 PluginDelete lua PluginDelete(<f-args>) ]]
cmd [[ command EasyUpdate lua PluginUpdate("easy.nvim") ]]
---------Mappings--------------------
map('', '<leader>t', ':tabe<CR>');
map('', '<leader>s', ':vsplit<CR>');
map('', '<leader>n', ':lua ToggleVExplorer()<CR>');
map('n', '<tab>', '<C-W>w', {noremap=true});
map('i', '"', '""<left>', {noremap=true});
map('i', "'", "''<left>", {noremap=true});
map('i', '(<CR>', '(<CR>)<ESC>O', {noremap=true});
map('i', '[<CR>', '[<CR>]<ESC>O', {noremap=true});
map('i', '{<CR>', '{<CR>}<ESC>O', {noremap=true});
----------Vim Commands----------------
cmd [[ set path+=** ]]
cmd [[ filetype plugin indent on ]]
cmd [[ hi! link netrwMarkFile Search ]]
cmd [[ set guitablabel=%N/\ %t\ %M ]]
-----------AutoCompletion---------------
cmp.setup({
    snippet = {
      expand = function(args)
        require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
----------Language server protocol setup--------------
lsp.clangd.setup{};
lsp.tsserver.setup{};
lsp.jsonls.setup {};
lsp.html.setup{};
lsp.cssls.setup{};
-----------Options--------------
opt.shiftwidth = 4;
opt.scrolloff = 1;
opt.tabstop = 4;
opt.sidescrolloff = 5;
opt.number = true;
opt.title = true;
opt.expandtab = true;
opt.errorbells = false;
opt.smartcase = true;
opt.wrap = true;
opt.showmatch = true;
opt.ignorecase = true;
opt.linebreak = true;
opt.cursorline = true;
opt.swapfile = false;
opt.autochdir = true;
opt.backup = false;
opt.wb = false;
opt.shiftround = true;
opt.termguicolors = true;
opt.completeopt = {'menuone','noinsert', 'noselect'};
opt.backspace = {'indent', 'eol', 'start'};
opt.clipboard = {'unnamed'};
