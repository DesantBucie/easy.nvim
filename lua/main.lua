local cmd = vim.api.nvim_command;  
local fn = vim.fn;    
local g = vim.g;      
local opt = vim.opt;  
local create_cmd = vim.api.nvim_create_user_command
local cmp = require'cmp'
require('nvim-autopairs').setup{}
require'path' -- All paths
require'template'
-----------Functions---------
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then 
      options = vim.tbl_extend('force', options, opts) 
  end
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
create_cmd('PluginInstall', 'lua PluginInstall(<f-args>)', { nargs = 1 })
create_cmd('PluginUpdate', PluginUpdate, {})
create_cmd('PluginList',  PluginList, {})
create_cmd('PluginDelete', 'lua PluginDelete(<f-args>)', { nargs = 1 })
---------Mappings--------------------
map('', '<leader>t', ':tabe<CR>');
map('', '<leader>s', ':vsplit<CR>');
map('', '<leader>n', ':lua ToggleVExplorer()<CR>');
map('n', '<tab>', '<C-W>w', {noremap=true});
----------Vim Commands----------------
cmd [[ filetype plugin indent on ]]
--vim.highlight.link('netrwMarkFile', 'Search', true)
vim.api.nvim_set_hl(0, 'netrwMarkFile', { link = 'Search' })
create_cmd('Temp', 'lua template()', {})
-----------AutoCompletion---------------
cmp.setup({
    snippet = {
      expand = function(args)
	fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<C-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For snippy users.
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
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-----------Options--------------
opt.viminfo = '';
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
opt.guitablabel = '%N/ %t %M'
opt.path = opt.path + '**'
