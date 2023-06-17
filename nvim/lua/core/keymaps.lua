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
map('i', 'jj', '<Esc>')
map('i', '<S-CR>', '<Esc>o')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohlserach<CR>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- map Ctrl shift c v to copy and paste
map('n','<C-S-v>','"+p')
map('v','<C-S-v>','"+p')
map('i','<C-S-v>','<C-R>+')
map('v','<C-S-c>','"+y')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')
map('n', '<leader>w', ':w<CR>',{nowait = true})

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------
-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
-- Term
map('n', '<C-t>', ':ToggleTerm<CR>')
map('n', '<f1>', ':Telescope<CR>')

-- make
vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<f5>",
                ":w<CR>:python %<CR>",
                { silent = true, noremap = true }
            )
        end,
    })

