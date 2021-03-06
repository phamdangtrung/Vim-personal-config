local map = require('core.utils').keymap.map

vim.g.mapLeader = ' '
local opts = { noremap = true, silent = true }
local opts_map = { noremap = false, silent = true }

-- Normal
map('i', 'jk', '<Esc>')
map('i', 'kj', '<Esc>')

-- Buffer
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

-- Window
vim.cmd('noremap <leader>1 1gt')
vim.cmd('noremap <leader>2 2gt')
vim.cmd('noremap <leader>3 3gt')
vim.cmd('noremap <leader>4 4gt')
vim.cmd('noremap <leader>5 5gt')
vim.cmd('noremap <leader>6 6gt')
vim.cmd('noremap <leader>7 7gt')
vim.cmd('noremap <leader>8 8gt')
vim.cmd('noremap <leader>9 9gt')

-- Insert

-- Tagbar
map('n', '<F8>', ':TagbarToggle<CR>')

-- NerdTree
map('n', '<C-n>', ' :NvimTreeToggle<CR>', opts)

-- Telescope
if is_git_dir == 0 then
  map('n', '<C-p>', '<cmd>lua require"telescope.builtin".git_files()<CR>')
  map('n', '<C-l>', '<cmd>lua require"telescope.builtin".live_grep()<CR>')
else
  map('n', '<C-p>', '<cmd>lua require"telescope.builtin".find_files()<CR>')
  map('n', '<C-l>', '<cmd>lua require"telescope.builtin".live_grep()<CR>')
end

-- Luasnip
-- map('i', '<Tab>', "<silent><expr>")
vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'")

map('i', '<S-Tab>', "<cmd>lua require'luasnip'.jump(-1)<Cr>", opts)
map('i', '<Tab>', "<cmd>lua require'luasnip'.jump(1)<Cr>", opts)

map('s', '<Tab>', "<cmd>lua require('luasnip').jump(1)")
map('s', '<S-Tab>', "<cmd>lua require('luasnip').jump(-1)")
