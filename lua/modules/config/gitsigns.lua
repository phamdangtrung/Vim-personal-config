return function()
    local map = require('core.utils').keymap.map
    local gitsigns = safe_require 'gitsigns'
    if not gitsigns then
      return
    end
  
    gitsigns.setup {
      signs = {
        add = { hl = 'GitSignsAdd', text = '▎' },
        change = { hl = 'GitSignsChange', text = '▎' },
        delete = { hl = 'GitSignsDelete', text = '契' },
        topdelete = { hl = 'GitSignsDelete', text = '契' },
        changedelete = { hl = 'GitSignsChange', text = '▎' },
      },
    }
  
    -- Need to revise
    -- map('n', ']g', '&diff ? "]g" : "<cmd>Gitsigns next_hunk<CR>"', { expr = true })
    -- map('n', '[g', '&diff ? "[g" : "<cmd>Gitsigns prev_hunk<CR>"', { expr = true })

    -- Default
    -- map('n', '', 'Gitsigns blame_line')
  end
  