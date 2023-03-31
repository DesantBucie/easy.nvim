local cmd = vim.api.nvim_command;  
local fn = vim.fn;    
local g = vim.g;      
local opt = vim.opt;  
local cmp = require'cmp'
local lsp = require'lspconfig' -- use this to set additional lsp server
require'main'
--- Personal addons ----
--opt.termguicolors = false -- In case of broken colors
--lsp.clangd.setup{};
--lsp.tsserver.setup{};
--lsp.jsonls.setup {};
--lsp.html.setup{};
--lsp.cssls.setup{};
