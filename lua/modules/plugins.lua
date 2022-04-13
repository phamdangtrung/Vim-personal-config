local function conf(name)
    return require(string.format('modules.config.%s', name))
end

return {
  { -- Colorschemes
    'rafi/awesome-vim-colorschemes',
    config = conf 'colors',
  },
  { -- Tagbar
    'preservim/tagbar',
    config = conf 'tagbar'
  },
  { -- Icons
    'kyazdani42/nvim-web-devicons',
    config = conf 'nvim-web-devicons',
  },
  { -- Fuzzy Finder
    'nvim-telescope/telescope.nvim',
    config = conf 'telescope',
    requires = { 'nvim-lua/plenary.nvim' },
  },
  { -- Treesiter
    {
      'nvim-treesitter/nvim-treesitter',
      config = conf 'nvim-treesitter',
      requires = {
        'JoosepAlviste/nvim-ts-context-commentstring',
        'p00f/nvim-ts-rainbow',
        'windwp/nvim-ts-autotag',
      }
    },
    {
      'RRethy/nvim-treesitter-endwise',
    },
  },
  { -- Lsp
    'neovim/nvim-lspconfig',
    -- config = conf 'nvim-lspconfig',
    requires = {
      'williamboman/nvim-lsp-installer',
      'ray-x/lsp_signature.nvim',
    },
  },
  { -- Lsp Status
    'nvim-lua/lsp-status.nvim'
  },
  { -- Nvim-dap
    'mfussenegger/nvim-dap'
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
    'tpope/vim-endwise',
  },
  { -- Ruby on Rails
    { -- Vim ruby
      'vim-ruby/vim-ruby',
    },
    { -- Vim rails
      'tpope/vim-rails'
    },
  },
  { -- Elixir
    { -- Alchemist
      'slashmili/alchemist.vim',
      requires = { 'elixir-lsp/elixir_sense', },
    },
    { -- Elixir
      'elixir-editors/vim-elixir',
    },
  },
  { -- Auto-Pairs
    'jiangmiao/auto-pairs'
  },
  { -- File Tree
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = conf 'filetree'
  },
  { -- Rainbow Ends
    'vim-scripts/rainbow-end'
  }

  -- { -- File tree
  --   { -- NerdTree
  --     'preservim/nerdtree',
  --     requires = {
  --       'ryanoasis/vim-devicons'
  --     },
  --     config = conf 'nerdtree',
  --   },
  --   { -- NerdTree syntax highlighting
  --     'tiagofumo/vim-nerdtree-syntax-highlight',
  --     config = conf 'nerdtree-syntax-highlight'
  --   },
  -- },
}