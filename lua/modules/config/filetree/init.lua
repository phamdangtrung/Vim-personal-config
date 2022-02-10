local tree = require 'nvim-tree'
local map = require('nvim-tree.config').nvim_tree_callback

tree.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = true,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 35,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = true, -- `custom_only = false` will merge list of mappings with defaults
      list = {
        { key = '<C-R>', cb = map 'refresh' },
        { key = 'a', cb = map 'create' },
        { key = 'd', cb = map 'remove' },
        { key = 'h', cb = map 'close_node' },
        { key = 'I', cb = map 'toggle_ignored' },
        { key = 'l', cb = map 'edit' },
        { key = 'r', cb = map 'rename' },
        { key = 't', cb = map 'tabnew' },
        { key = 's', cb = map 'split' },
        { key = 'v', cb = map 'vsplit' },
        { key = 'Y', cb = map 'copy_path' },
        { key = 'y', cb = map 'copy_name' },
      },
    },
    number = true,
    relativenumber = true,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = false,
    }
  }
}