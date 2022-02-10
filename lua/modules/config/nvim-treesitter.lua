local treesitter = require 'nvim-treesitter.configs'
if not treesitter then
  return
end

treesitter.setup {
  ensure_installed = {
    'ruby',
    'c_sharp',
    'go',
    'haskell',
    'erlang',
    'html',
    'javascript',
    'json',
    'css',
    'markdown',
    'lua',
    'rust',
    'vim',
    'vue',
    'yaml'
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { 'json' }, -- list of language that will be disabled
  },
  indent = { enable = true },
  autopairs = {
    enable = true,
    extended_mode = true,
  },
  endwise = {
    enable = true
  },
  rainbow = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
}