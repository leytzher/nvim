----------------------------------------------------------
--- General Neovim settings and configuration
----------------------------------------------------------

--- Neovim API aliases
local exec = vim.api.nvim_exec				        --- execute vimscript
local g = vim.g		    				            --- global variables
local opt = vim.opt					                --- set options (global/buffer/windows-scoped)
local cmd = vim.cmd                                 --- execute vim commands

--- Configuration
-----------------

-- General
opt.mouse = 'a'						                --- Enable mouse support
opt.clipboard = 'unnamedplus'				        --- copy/paste to system clipboard
opt.swapfile = false					            --- Don't use swapfile
opt.completeopt = 'menuone,noselect'			    --- Autocomplete options
opt.encoding = 'utf-8'                              --- set encoding to UTF-8

-- Neovim UI
opt.number = true					                --- show line number
opt.relativenumber = true				            --- set relative number
opt.showmatch = true					            --- highlight matching parenthesis
opt.foldmethod = 'indent'			            	--- enable folding
opt.splitright = true					            --- vertical split to the right
opt.splitbelow = true					            --- horizontal split to the bottom
opt.ignorecase = true					            --- ignore case letters when search
opt.linebreak = true					            --- wrap on word boundary
opt.smartcase = true					            --- ignore lowercase for the whole pattern
opt.linebreak = true					            --- wrap on word boundary
opt.termguicolors = true				            --- enable 24 bit RGB colors

-- Tabs and indentation
opt.expandtab = true					            --- use spaces instead of tab
opt.shiftwidth = 4					                --- shift 4 spaces when tab
opt.tabstop = 4						                --- 1 tab == 4 spaces
opt.smartindent = true					            --- autoindent new lines

-- Memory, CPU
opt.hidden = true                                   --- enable background buffers
opt.history = 100                                   --- remember n lines in history
opt.lazyredraw = true                               --- faster scrolling
opt.synmaxcol = 240                                 --- max column for syntax highlighting
opt.updatetime = 400                                --- ms to wait for trigger 'document_highlight'


--- Startup
opt.shortmess:append "sI"                           --- disable nvim intro

--- Highlight on yank
exec([[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=50}
    augroup end
    ]], false)

--- remove whitespace on save
cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

--- don't autocoment new lines
cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

--- Terminal
cmd [[command Term :botright vsplit term://$SHELL]]  --- open terminal pane on the right when using :Term

--- some terminal tweaks
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber  nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
    ]]

