local map = require('core.utils').keymap.map

vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }

-- Normal
map('i', 'jk', '<Esc>')
map('i', 'kj', '<Esc>')

-- Buffer
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

-- Window

-- Insert

-- Tagbar
map('n', '<F8>', ':TagbarToggle<CR>')

-- NerdTree
map('n', '<C-t>', ' :NERDTreeToggle<CR>', opts)

-- Telescope
if is_git_dir == 0 then
  map('n', '<C-p>', '<cmd>lua require"telescope.builtin".git_files()<CR>')
else
  map('n', '<C-p>', '<cmd>lua require"telescope.builtin".find_files()<CR>')
end