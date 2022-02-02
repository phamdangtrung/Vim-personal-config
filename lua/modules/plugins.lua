local function conf(name)
    return require(string.format('modules.config.%s', name))
end

return {
  { -- Colorschemes
    'rafi/awesome-vim-colorschemes',
    config = conf 'colors',
  },
  -- { -- Airline
  --   { -- Base
  --     'vim-airline/vim-airline',
  --     config = conf 'airline'
  --   },
  --   { -- Theme
  --     'vim-airline/vim-airline-themes',
  --     config = conf 'airline-themes'
  --   },
  -- },
  { -- Tagbar
    'preservim/tagbar',
    config = conf 'tagbar'
  },
  { -- Icons
    'kyazdani42/nvim-web-devicons',
    config = conf 'nvim-web-devicons',
  },
  { -- File tree
    { -- NerdTree
      'preservim/nerdtree',
      requires = {
        'ryanoasis/vim-devicons'
      },
      config = conf 'nerdtree',
    },
    { -- NerdTree syntax highlighting
      'tiagofumo/vim-nerdtree-syntax-highlight',
      config = conf 'nerdtree-syntax-highlight'
    },
  },
  { -- Fuzzy Finder
    'nvim-telescope/telescope.nvim',
    config = conf 'telescope',
    requires = { 'nvim-lua/plenary.nvim' },
  },
  { -- Treesiter
    'nvim-treesitter/nvim-treesitter',
    config = conf 'nvim-treesitter',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'p00f/nvim-ts-rainbow',
      'windwp/nvim-ts-autotag',
    }
  },
  { -- Lsp
    'neovim/nvim-lspconfig',
    config = conf 'nvim-lspconfig',
    requires = {
      'williamboman/nvim-lsp-installer',
      'ray-x/lsp_signature.nvim',
    },
  },
  { -- Git related
    { -- Gitsign
      'lewis6991/gitsigns.nvim',
      config = conf 'gitsigns',
      requires = { 'nvim-lua/plenary.nvim' },
    },
    { -- Like magit
      'TimUntersberger/neogit',
      config = conf 'neogit',
      requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' },
    },
  },
  { -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    config = conf 'nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'onsails/lspkind-nvim', -- Enables icons on completions
      {
        'L3MON4D3/LuaSnip',
        requires = {
          'saadparwaiz1/cmp_luasnip',
          'rafamadriz/friendly-snippets',
        },
      },
    },
  },
  { -- Comments
    { 'tpope/vim-commentary' },
    { 'tpope/vim-surround', requires = { 'tpope/vim-repeat' } },
  },
  { -- Autopairs
    'windwp/nvim-autopairs',
    config = conf 'nvim-autopairs',
  },
  { -- Indent guides
    'lukas-reineke/indent-blankline.nvim',
    config = conf 'indent-blankline',
  },
  { -- Bufferline
    'akinsho/nvim-bufferline.lua',
    config = conf 'nvim-bufferline',
  },
  { -- Statusline
    'nvim-lualine/lualine.nvim',
    config = conf 'lualine',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  },
  { -- Colorizer
    'norcalli/nvim-colorizer.lua',
    config = conf 'nvim-colorizer',
  },
  { -- Omnisharp
    'OmniSharp/omnisharp-vim',
    config = conf 'omnisharp'
  },
  { -- Endwise
    'tpope/vim-endwise'
  },
  { -- Vim ruby
    'vim-ruby/vim-ruby'
  }
}