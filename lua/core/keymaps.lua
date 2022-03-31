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
