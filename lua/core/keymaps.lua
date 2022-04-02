--- Define keybindings

--- create mapping function for easier binding:
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--- Leader key
vim.g.mapleader = ' '                                   --- set leader key to space

--- map Esc to jk
map('i', 'jk', '<Esc>')                                 --- use jk as Esc when in Insert mode
map('i', 'kj', '<Esc>')                                 --- use kj as Esc when in Insert mode

--- don't use arrow keys
map('', '<up>','<nop>')
map('', '<down>','<nop>')
map('', '<left>','<nop>')
map('', '<right>','<nop>')

--- move around splits using <ctrl> + {h,j,k,l}
map('n','<C-h>','<C-w>h')
map('n','<C-j>','<C-w>j')
map('n','<C-k>','<C-w>k')
map('n','<C-l>','<C-w>l')


---  Applications and plugins shortcuts
---------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })      --- use <ctrl> + t to open terminal (instead of :Term)
map('n', '<Esc>', '<C-\\><C-n>')                        --- exit

-- nvim-tree keybindings
map('n', 'nt', [[:NvimTreeToggle<CR>]],{})                  --- toggle nvim-tree using <Leader> + nt

-- telescope keybindings
map('n','<leader>ff', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]])
map('n','<leader>fg', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]])
map('n','<leader>fb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]])
map('n','<leader>fh', [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]])

-- hop keybingings
map('n','<C-h>l',[[:HopLine<CR>]],{})    --- Hop line
map('n','<C-h>w',[[:HopWord<CR>]],{})    --- Hop word
map('n','<C-h>c',[[:HopChar1<CR>]],{})    --- Hop 1 character
map('n','<C-h>cc',[[:HopChar2<CR>]],{})    --- Hop 2 characters
map('n','<C-h>p',[[:HopPattern<CR>]],{})    --- Hop pattern (similar to /)

-- toggle maximizer
map('n','<leader>m', [[<Cmd>lua require('maximizer').toggle_maximize()<CR>]])

-- toggle transparency
map('n','<leader>t', [[:TransparentToggle<CR>]])

-- focus
map('n','<S-f>t', [[:FocusToggle<CR>]],{silent=true})     -- focus toggle
map('n','<S-f>m', [[:FocusMaximise<CR>]],{silent=true})     -- focus maximize
map('n','<S-f>e', [[:FocusEqualise<CR>]],{silent=true})     -- focus equalise
map('n','<S-f>n', [[:FocusSplitNicely<CR>]],{silent=true})     -- focus split nicely
map('n','<S-f>h', [[:FocusSplitLeft<CR>]],{silent=true})
map('n','<S-f>l', [[:FocusSplitRight<CR>]],{silent=true})
map('n','<S-f>j', [[:FocusSplitDown<CR>]],{silent=true})
map('n','<S-f>k', [[:FocusSplitUp<CR>]],{silent=true})
map('n','<S-f>v', [[:FocusMaxOrEqual<CR>]],{silent=true})  --- toggles between split and maximize
map('n','<S-f>c', [[:FocusSplitCycle<CR>]],{silent=true})


