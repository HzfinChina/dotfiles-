vim.g.vimtex_view_method = 'zathura'
vim.cmd([[ 
    autocmd CursorHoldI,TextChanged *.tex write
     ]])
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_quickfix_ignore_filters = {'Unused', 'font'}
