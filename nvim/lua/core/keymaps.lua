-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- use arrow keys to toggle buffer
map('n', '<left>', ':bprevious<CR>')
map('n', '<right>', ':bnext<CR>')

-- Map Esc to jj
map('i', '<S-CR>', '<Esc>o')

-- Map Ctrl shift t to open terminal in current folder
-- map('n','<C-S-T>', '')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohlsearch<CR>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
-- resize using Ctrl + {left, right, up, down}
map('n', '<C-left>', '<C-w><C-<>')
map('n', '<C-right>', '<C-w><C->>')
map('n', '<C-up>', '<C-w><C-+>')
map('n', '<C-down>', '<C-w><C-->')


-- map Ctrl shift c v to copy and paste
map('n','<C-S-v>','"+p')
map('v','<C-S-v>','"+p')
map('i','<C-S-v>','<C-R>+')
map('v','<C-S-c>','"+y')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':TroubleToggle<CR>',{nowait=true})
map('n', '<leader>d',' :bd<CR>',{nowait = true})

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------
-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
-- Term

map('n', '<A-t>', [[<cmd>ToggleTerm direction=float<CR>]])
map('n', '<C-t>', '<cmd>ToggleTerm<CR>')
-- map('t','<Esc>',[[<C-\><C-n>]])

-- Telescope
map('n', '<f1>', ':Telescope<CR>')

-- Hop
map('n','<leader>h',':HopWord<CR>')
-- neovide

if vim.g.neovide then
  map('n','<C-=>',':let g:neovide_scale_factor = g:neovide_scale_factor + 0.05<CR>')
  map('n','<C-->',':let g:neovide_scale_factor = g:neovide_scale_factor - 0.05<CR>')
end
